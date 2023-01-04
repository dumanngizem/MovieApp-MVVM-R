//
//  APIDataProvider.swift
//  DataProvider
//
//  Created by Gizem Duman on 9.11.2022.
//

import Alamofire

public struct APIDataProvider: DataProviderProtocol {
    
    private let interceptor: RequestInterceptor?
    private let session: Session
    
    public init(interceptor: RequestInterceptor? = nil,
                eventMonitors: [EventMonitor] = []) {
        self.interceptor = interceptor
        self.session = Session(interceptor: interceptor, eventMonitors: eventMonitors)
        self.session.sessionConfiguration.timeoutIntervalForRequest = 10
        self.session.sessionConfiguration.timeoutIntervalForResource = 10
        self.session.sessionConfiguration.requestCachePolicy = .reloadRevalidatingCacheData
    }
    
    private func createRequest<T: RequestProtocol>(_ request: T) -> DataRequest {
        let adapter = APIRequestAdapter(request: request)
        let request = session.request(adapter.url,
                                      method: adapter.method,
                                      parameters: adapter.parameters,
                                      encoding: adapter.encoding,
                                      headers: adapter.headers)
        return request
    }
    
    private func createUploadRequest<T: RequestProtocol>(_ request: T, files: [MultiPartFileData]) -> DataRequest {
        let adapter = APIRequestAdapter(request: request)
        let request = session.upload(multipartFormData: { multiPart in
            // Parameters
            request.parameters.forEach { values in
                if let myData = "\(values.value)".data(using: .utf8) {
                    multiPart.append(myData, withName: values.key)
                }
            }
            // Files
            files.forEach { multiPartFileData in
                multiPart.append(multiPartFileData.data,
                                 withName: multiPartFileData.key,
                                 fileName: multiPartFileData.fileName,
                                 mimeType: multiPartFileData.mimeType.rawValue)
            }
        }, to: adapter.url, method: adapter.method, headers: adapter.headers).uploadProgress { progress in
            print(progress.fractionCompleted)
        }
        return request
    }
    
    public func request<T: DecodableResponseRequest>(for request: T, result: DataProviderResult<T.ResponseType>? = nil) {
        let request = createRequest(request)
        request.validate()
        request.responseDecodable(of: T.ResponseType.self) { (response) in
            switch response.result {
            case .success(let value):
                result?(.success(value))
            case .failure(let error):
                if error.isTimeout {
                    result?(.failure(.timeOut))
                } else {
                    let decoder = JSONDecoder()
                    if let data = response.data,
                       let baseError = try? decoder.decode([BaseErrorResponse].self, from: data).first {
                        result?(.failure(.baseError(baseError)))
                    } else {
                        result?(.failure(.baseError(error)))
                    }
                }
            }
    }
}
    
    public func uploadRequest<T: DecodableResponseRequest>(for request: T,
                                                           files: [MultiPartFileData], result: DataProviderResult<T.ResponseType>? = nil) {
        let myRequest = createUploadRequest(request, files: files)
        myRequest.validate()
        myRequest.responseDecodable(of: T.ResponseType.self) { (response) in
            switch response.result {
            case .success(let value):
                result?(.success(value))
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    result?(.failure(.timeOut))
                } else {
                    let decoder = JSONDecoder()
                    if let data = response.data,
                       let baseError = try? decoder.decode([BaseErrorResponse].self, from: data).first {
                        result?(.failure(.baseError(baseError)))
                    } else {
                        result?(.failure(.baseError(error)))
                    }
                }
            }
        }
    }
    
}
