//
//  MoviesCellModel.swift
//  UIComponents
//
//  Created by Gizem Duman on 23.12.2022.
//

import Foundation

public protocol MoviesCellDataSource: AnyObject {
    
}

public protocol MoviesCellEventSource: AnyObject {
    
}

public protocol MoviesCellProtocol: MoviesCellDataSource, MoviesCellEventSource {
    
}

public final class MoviesCellModel: MoviesCellProtocol {
    
}

