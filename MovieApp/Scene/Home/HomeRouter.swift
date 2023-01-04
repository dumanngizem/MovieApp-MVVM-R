//
//  HomeRouter.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

final class HomeRouter: Router, HomeRouter.Routes {
    typealias Routes = MovieDetailRoute & AllMoviesRoute
}
