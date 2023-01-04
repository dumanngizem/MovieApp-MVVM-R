//
//  MovieCellModel+Extentions.swift
//  MovieApp
//
//  Created by Gizem Duman on 12.11.2022.
//

import Foundation

extension MovieCellModel {
    convenience init(data: Movie) {
        self.init(title: data.title, imageUrl: URL(string: data.poster ?? ""), imdb: data.imdb, type: data.type, year: data.year)
    }
}
