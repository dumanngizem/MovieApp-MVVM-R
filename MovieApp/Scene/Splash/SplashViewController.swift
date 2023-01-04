//
//  SplashViewController.swift
//  MovieApp
//
//  Created by Gizem Duman on 13.11.2022.
//

import UIKit

final class SplashViewController: BaseViewController<SplashViewModel> {
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.viewDidLoad()
    }
}

// MARK: - UILayout
extension SplashViewController {
    
    private func addSubViews() {
        addIconImageView()
        addTitleLabel()
    }
    
    private func addIconImageView() {
        view.addSubview(iconImageView)
        iconImageView.centerInSuperview()
        iconImageView.size(.init(width: 200, height: 200))
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToBottom(of: iconImageView, offset: 20)
        titleLabel.centerX(to: iconImageView)
    }
}

// MARK: - ConfigureContents
extension SplashViewController {
    
    private func configureContents() {
        configureIconImageView()
        configureTitleLabel()
        configureNavigationController()
    }
    
    private func configureIconImageView() {
        iconImageView.image = Asset.Icons.icIcon.image
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Movie"
        titleLabel.textColor = .darkGray
        titleLabel.font = .systemFont(ofSize: 50, weight: .bold)
        titleLabel.textAlignment = .center
    }
    
    private func configureNavigationController() {
        navigationController?.isNavigationBarHidden = true
    }
}
