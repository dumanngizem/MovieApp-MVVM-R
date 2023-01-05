//
//  AllMoviesViewModel.swift
//  MovieApp
//
//  Created by Gizem Duman on 14.11.2022.
//

import Foundation

protocol AllMoviesViewDataSource {
    var numberOfItemsInSection: Int { get }
    
    func cellForItemAt(indexPath: IndexPath) -> VerticalMovieCellProtocol?
}

protocol AllMoviesViewEventSource {
    var reloadData: VoidClosure? { get set }
}

protocol AllMoviesViewProtocol: AllMoviesViewDataSource, AllMoviesViewEventSource {
    func viewDidLoad()
}

final class AllMoviesViewModel: BaseViewModel<AllMoviesRouter>, AllMoviesViewProtocol {
    
    // Privates
    private var cellItems: [VerticalMovieCellProtocol]?
    
    // Event Source
    var reloadData: VoidClosure?
    
    func viewDidLoad() {
        fetchMovies()
    }
}

// MARK: - DataSource
extension AllMoviesViewModel {
    
    func cellForItemAt(indexPath: IndexPath) -> VerticalMovieCellProtocol? {
        return cellItems?[indexPath.row]
    }
    
    var numberOfItemsInSection: Int {
        return cellItems?.count ?? 0
    }
}

// MARK: - ConfigureContents
extension AllMoviesViewModel {
    
    private func configureCellItems(items: [Movie]?) {
        guard let items = items else { return }
        let cellItem = items.map({ VerticalMovieCellModel(imageUrl: URL(string: $0.poster ?? ""), title: $0.title, imdb: $0.imdb, year: $0.year)})
        cellItems = cellItem
    }
}

// MARK: - Requests
extension AllMoviesViewModel {
    
    private func fetchMovies() {
        let request = SearchMovieRequest()
        dataProvider?.request(for: request, result: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.configureCellItems(items: response.search)
                self.reloadData?()
            case .failure( _):
                print("error")
            }
        })
    }
}
