//
//  VerticalMovieCellModel.swift
//  UIComponents
//
//  Created by Gizem Duman on 17.11.2022.
//

import Foundation

public protocol VerticalMovieCellDataSource: AnyObject {
    var imageUrl: URL? { get set }
    var title: String? { get set }
    var year: String? { get set }
    var imdb: String? { get set }
}

public protocol VerticalMovieCellEventSource: AnyObject {
    
}

public protocol VerticalMovieCellProtocol: VerticalMovieCellDataSource, VerticalMovieCellEventSource {
    
}

public final class VerticalMovieCellModel: VerticalMovieCellProtocol {
    
    public var imageUrl: URL?
    public var title: String?
    public var year: String?
    public var imdb: String?
    
    public init(imageUrl: URL?, title: String?, imdb: String?, year: String?) {
        self.imageUrl = imageUrl
        self.title = title
        self.year = year
        self.imdb = imdb
    }
}

