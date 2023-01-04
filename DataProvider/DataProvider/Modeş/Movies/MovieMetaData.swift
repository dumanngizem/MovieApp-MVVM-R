//
//  MovieMetaData.swift
//  DataProvider
//
//  Created by Gizem Duman on 10.11.2022.
//

import Foundation

public struct MovieMetaData: Decodable {
    
    public let search: [Movie]?
    public let totalResults: String?
    public let response: String?
    
    public enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }
}
