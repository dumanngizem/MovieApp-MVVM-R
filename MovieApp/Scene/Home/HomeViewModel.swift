//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import Foundation

enum HomeViewCellType: CaseIterable {
    case slider
    case body
}

protocol HomeViewDataSource {
    var section: Int { get }
    var sliderCellItems: SliderCellProtocol? { get set }
    var isEmpty: Bool { get }
   
    func cellForRowAt(indexPath: IndexPath) -> MovieCellProtocol?
    func numberOfRowsInSection(section: Int) -> Int
    func heightForHeaderInSection(section: Int) -> CGFloat
}

protocol HomeViewEventSource {
    var reloadData: VoidClosure? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func viewDidLoad()
    func presentMovieDetail(indexPath: IndexPath)
    func presentAllMovies()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
    // Privates
    private var cellItems: [MovieCellProtocol]?
    
    // Publics
    var sliderCellItems: SliderCellProtocol?
    
    // Event Sources
    var reloadData: VoidClosure?
    
    func viewDidLoad() {
        fetchMovies()
    }
}

// MARK: - DataSource
extension HomeViewModel {
    
    var section: Int {
        return 2
    }
    
    var isEmpty: Bool {
        cellItems?.isEmpty ?? true
    }
    
    func cellForRowAt(indexPath: IndexPath) -> MovieCellProtocol? {
        return cellItems?[indexPath.row]
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        switch HomeViewCellType.allCases[section] {
        case .slider:
            return 1
        case .body:
            return cellItems?.isEmpty == true ? 1 : cellItems?.count ?? 1
        }
    }
    
    func heightForHeaderInSection(section: Int) -> CGFloat {
        switch HomeViewCellType.allCases[section] {
        case .slider:
            return 0
        case .body:
            return 52
        }
    }
}

// MARK: - ConfigureContents
extension HomeViewModel {
    
    private func configureCellItems(items: [Movie]?) {
        guard let cells = items else { return }
        let cell = cells.map({ MovieCellModel(data: $0) })
        cellItems = cell
    }
    
    private func configureSliderCellItems(items: [Movie]?) {
        guard let cells = items else { return }
        let sliderCell = cells.map({ SliderImageCellModel(imageURL: URL(string: $0.poster ?? "")) })
        let cell = SliderCellModel(cellItems: sliderCell)
        sliderCellItems = cell
    }
}

// MARK: - Routers
extension HomeViewModel {
    
    func presentMovieDetail(indexPath: IndexPath) {
        if cellItems?.isEmpty == false {
            let item = cellItems?[indexPath.row]
            router.pushMovieDetail(image: item?.imageUrl, title: item?.title, imdb: item?.imdb, type: item?.type)
        }
    }
    
    func presentAllMovies() {
        router.pushAllMovies()
    }
}

// MARK: - Requests
extension HomeViewModel {
    
    private func fetchMovies() {
        let request = SearchMovieRequest()
        dataProvider?.request(for: request, result: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.configureCellItems(items: response.search)
                self.configureSliderCellItems(items: response.search)
                self.reloadData?()
            case .failure(_):
                print("error")
            }
        })
    }
}
