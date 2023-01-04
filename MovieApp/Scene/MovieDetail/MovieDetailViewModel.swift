//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Gizem Duman on 11.11.2022.
//

import Foundation

protocol MovieDetailViewDataSource {
    var movieImage: URL? { get }
    var movieTitle: String? { get }
    var movieImdb: String? { get }
    var movieType: String? { get }
}

protocol MovieDetailViewEventSource {}

protocol MovieDetailViewProtocol: MovieDetailViewDataSource, MovieDetailViewEventSource {}

final class MovieDetailViewModel: BaseViewModel<MovieDetailRouter>, MovieDetailViewProtocol {
    
    private var image: URL?
    private var title: String?
    private var imdb: String?
    private var type: String?
    
    init(router: MovieDetailRouter,image: URL?, title: String?, imdb: String?, type: String?) {
        super.init(router: router)
        self.image = image
        self.title = title
        self.imdb = imdb
        self.type = type
    }
}

// MARK: - DataSource
extension MovieDetailViewModel {
    
    var movieImage: URL? {
        return image
    }
    
    var movieTitle: String? {
        return title
    }
    
    var movieImdb: String? {
        return imdb
    }
    
    var movieType: String? {
        return type
    }
}
