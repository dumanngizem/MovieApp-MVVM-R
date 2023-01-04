//
//  File.swift
//  DataProvider
//
//  Created by Gizem Duman on 10.11.2022.
//

import Foundation

public struct Movie: Decodable {
    
    public let title: String?
    public let year: String?
    public let imdb: String?
    public let type: String?
    public let poster: String?

    public enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdb = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
