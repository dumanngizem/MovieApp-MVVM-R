//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Gizem Duman on 9.11.2022.
//

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
