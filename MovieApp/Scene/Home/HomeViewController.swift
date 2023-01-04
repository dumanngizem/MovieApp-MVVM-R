//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import UIKit
import TinyConstraints

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MovieCell.self)
        tableView.register(SliderCell.self)
        tableView.register(EmptyCell.self)
        tableView.separatorStyle = .none
        tableView.bounces = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.viewDidLoad()
        subcribeViewModel()
    }
    
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        addTableView()
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        configureTableView()
        configureNavigationController()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureNavigationController() {
        navigationItem.title = "Anasayfa"
    }
}

// MARK: - SubscribeViewModel
extension HomeViewController {
    
    private func subcribeViewModel() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.presentMovieDetail(indexPath: indexPath)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch HomeViewCellType.allCases[indexPath.section] {
        case .slider:
            let cell: SliderCell = tableView.dequeueReusableCell(for: indexPath)
            if let viewModel = viewModel.sliderCellItems {
                cell.set(viewModel: viewModel)
            }
            return cell
        case .body:
            if viewModel.isEmpty {
                let cell: EmptyCell = tableView.dequeueReusableCell(for: indexPath)
                cell.title = "Veri Yok"
                return cell
            } else {
                let cell: MovieCell = tableView.dequeueReusableCell(for: indexPath)
                cell.delegate = self
                if let viewModel = viewModel.cellForRowAt(indexPath: indexPath) {
                    cell.set(viewModel: viewModel)
                }
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch HomeViewCellType.allCases[section] {
        case .slider:
            return nil
        case .body:
            let view = SeeAllTableViewHeader()
            view.titleText = "Movie"
            view.buttonText = "See All Movies"
            view.delegate = self
            return view 
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightForHeaderInSection(section: section)
    }
}

// MARK: - MovieCellDelegate
extension HomeViewController: MovieCellDelegate {
    
    func movieCellShareButtonTapped(title: String?) {
        guard let title = title else { return }
        let items: [Any] = [title]
        share(items: items)
    }
}

// MARK: - SeeAllTableViewHeaderDelegate
extension HomeViewController: SeeAllTableViewHeaderDelegate {
 
    func seeAllButtonTapped() {
        viewModel.presentAllMovies()
    }
}
