//
//  MovieCellModel.swift
//  UIComponents
//
//  Created by Gizem Duman on 11.11.2022.
//

import Foundation

public protocol MovieCellDataSource: AnyObject {
    var title: String? { get set }
    var imageUrl: URL? { get set }
    var imdb: String? { get set }
    var type: String? { get set }
    var year: String? { get set }
}

public protocol MovieCellEventSource: AnyObject {
    
}

public protocol MovieCellProtocol: MovieCellDataSource, MovieCellEventSource {
    
}

public final class MovieCellModel: MovieCellProtocol {
    
    public var title: String?
    public var imageUrl: URL?
    public var imdb: String?
    public var type: String?
    public var year: String?
    
    public init(title: String? = "Not Title", imageUrl: URL?, imdb: String?, type: String?, year: String?) {
        self.title = title
        self.imageUrl = imageUrl
        self.imdb = imdb
        self.type = type
        self.year = year
    }
    
}
