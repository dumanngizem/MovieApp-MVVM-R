//
//  AllMoviesRoute.swift
//  MovieApp
//
//  Created by Gizem Duman on 14.11.2022.
//

protocol AllMoviesRoute {
    func pushAllMovies()
}

extension AllMoviesRoute where Self: RouterProtocol {
    
    func pushAllMovies() {
        let router = AllMoviesRouter()
        let viewModel = AllMoviesViewModel(router: router)
        let viewController = AllMoviesViewController(viewModel: viewModel)

        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
