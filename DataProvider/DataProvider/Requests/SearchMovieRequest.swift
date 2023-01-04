//
//  SearchMovieRequest.swift
//  DataProvider
//
//  Created by Gizem Duman on 10.11.2022.
//

public struct SearchMovieRequest: SMRequest {

    public typealias ResponseType = MovieMetaData
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {
        parameters = ["s" : "Thor"]
    }
    
}
