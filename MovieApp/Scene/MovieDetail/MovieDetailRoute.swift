//
//  MovieDetailRoute.swift
//  MovieApp
//
//  Created by Gizem Duman on 11.11.2022.
//

protocol MovieDetailRoute {
    func pushMovieDetail(image: URL?, title: String?, imdb: String?, type: String?)
}

extension MovieDetailRoute where Self: RouterProtocol {
    
    func pushMovieDetail(image: URL?, title: String?, imdb: String?, type: String?) {
        let router = MovieDetailRouter()
        let viewModel = MovieDetailViewModel(router: router, image: image, title: title, imdb: imdb, type: type)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
