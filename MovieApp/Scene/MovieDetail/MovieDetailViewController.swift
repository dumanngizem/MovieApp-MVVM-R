//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Gizem Duman on 11.11.2022.
//

import UIKit
import TinyConstraints
import Kingfisher

final class MovieDetailViewController: BaseViewController<MovieDetailViewModel> {
    
    private let movieImageView: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        return label
    }()
    
    private let imdbLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let shareButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 12
        button.setImage(Asset.Icons.icShare.image, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
}

// MARK: - UILayout
extension MovieDetailViewController {
    
    private func addSubViews() {
        addMovieImageView()
        addTitleLabel()
        addImdbLabel()
        addTypeLabel()
    }
    
    private func addMovieImageView() {
        view.addSubview(movieImageView)
        movieImageView.edgesToSuperview(excluding: .bottom)
        movieImageView.height(UIScreen.main.bounds.height * 0.40)
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToBottom(of: movieImageView, offset: 20)
        titleLabel.centerX(to: movieImageView)
    }
    
    private func addImdbLabel() {
        view.addSubview(imdbLabel)
        imdbLabel.topToBottom(of: titleLabel, offset: 20)
        imdbLabel.centerX(to: titleLabel)
    }
    
    private func addTypeLabel() {
        view.addSubview(typeLabel)
        typeLabel.topToBottom(of: imdbLabel, offset: 20)
        typeLabel.centerX(to: imdbLabel)
    }
}

// MARK: - ConfigureContents
extension MovieDetailViewController {
    
    private func configureContents() {
        configureMovieImageView()
        configureTitleLabel()
        configureNavbarTitle()
        configureImdbLabel()
        configureTypeLabel()
        configureNavbarButton()
    }
    
    private func configureMovieImageView() {
        movieImageView.kf.setImage(with: viewModel.movieImage)
    }
    
    private func configureTitleLabel() {
        titleLabel.text = viewModel.movieTitle
    }
    
    private func configureNavbarTitle() {
        navigationItem.title = viewModel.movieTitle
    }
    
    private func configureImdbLabel() {
        imdbLabel.text = viewModel.movieImdb
    }
    
    private func configureTypeLabel() {
        typeLabel.text = viewModel.movieType
    }
    
    private func configureNavbarButton() {
        shareButton.size(.init(width: 24, height: 24))
        shareButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
       let button = UIBarButtonItem(customView: shareButton)
        navigationItem.rightBarButtonItem = button
    }
}

// MARK: - Actions
extension MovieDetailViewController {
    
    @objc
    func shareTapped() {
        if let title = viewModel.movieTitle, let image = viewModel.movieImage {
            let items: [Any] = [title, image]
            share(items: items)
        }
    }
}
