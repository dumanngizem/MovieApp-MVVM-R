//
//  MovieCell.swift
//  UIComponents
//
//  Created by Gizem Duman on 11.11.2022.
//

import UIKit
import TinyConstraints
import Kingfisher

public protocol MovieCellDelegate: AnyObject {
    func movieCellShareButtonTapped(title: String?)
}

public class MovieCell: UITableViewCell, ReusableView {
    
    private let movieImageView: UIImageView = {
       let movieImage = UIImageView()
        movieImage.layer.cornerRadius = 12
        movieImage.layer.masksToBounds = true
        return movieImage
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let imdbLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    
    private let typeImageView: UIImageView = {
       let image = UIImageView()
        image.tintColor = .white
        return image
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.numberOfLines = 1
        return label
    }()
    
    private let yearImageView: UIImageView = {
       let image = UIImageView()
        image.tintColor = .white
        return image
    }()
    
    private let shareButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 12
        return button
    }()
    
    weak var viewModel: MovieCellProtocol?
    public weak var delegate: MovieCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    public func set(viewModel: MovieCellProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
    
}

// MARK: - UILayout
extension MovieCell {
    
    private func addSubViews() {
        addMovieImageView()
        addTitleLabel()
        addImdbLabel()
        addTypeImageView()
        addYearLabel()
        addYearImageView()
        addShareButton()
    }
    
    private func addMovieImageView() {
        contentView.addSubview(movieImageView)
        movieImageView.edgesToSuperview(excluding: [.trailing], insets: .left(20) + .vertical(20))
        movieImageView.width(100)
        movieImageView.height(120, priority: .defaultHigh)
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.leadingToTrailing(of: movieImageView, offset: 8)
        titleLabel.top(to: movieImageView, offset: 4)
        titleLabel.trailingToSuperview(offset: -20)
    }
    
    private func addImdbLabel() {
        contentView.addSubview(imdbLabel)
        imdbLabel.topToBottom(of: titleLabel, offset: 4)
        imdbLabel.trailing(to: titleLabel)
        imdbLabel.leading(to: titleLabel)
    }
    
    private func addTypeImageView() {
        movieImageView.addSubview(typeImageView)
        typeImageView.top(to: movieImageView, offset: 4)
        typeImageView.trailing(to: movieImageView, offset: -4)
        typeImageView.size(.init(width: 24, height: 24))
    }
    
    private func addYearLabel() {
        contentView.addSubview(yearLabel)
        yearLabel.topToBottom(of: imdbLabel, offset: 4)
        yearLabel.leading(to: imdbLabel)
        yearLabel.trailing(to: imdbLabel)
    }
    
    private func addYearImageView() {
        contentView.addSubview(yearImageView)
        yearImageView.bottom(to: movieImageView, offset: -4)
        yearImageView.leadingToTrailing(of: movieImageView, offset: 4)
        yearImageView.size(.init(width: 24, height: 24))
    }
    
    private func addShareButton() {
        contentView.addSubview(shareButton)
        shareButton.trailingToSuperview(offset: 20)
        shareButton.bottomToSuperview(offset: -20)
        shareButton.size(.init(width: 24, height: 24))
    }
}

// MARK: - ConfigureContents
extension MovieCell {
    
    private func configureContents() {
        configureMovieImageView()
        configureTitleLabel()
        configureImdbLabel()
        configureTypeImageView()
        configureYearLabel()
        configureYearImageView()
        configureShareButton()
    }
    
    private func configureMovieImageView() {
        movieImageView.kf.setImage(with: viewModel?.imageUrl)
    }
    
    private func configureTitleLabel() {
        titleLabel.text = viewModel?.title
    }
    
    private func configureImdbLabel() {
        imdbLabel.text = viewModel?.imdb
    }
    
    private func configureTypeImageView() {
        let image = viewModel?.type == "movie" ? Asset.Icons.icCamera.image.withRenderingMode(.alwaysTemplate) : Asset.Icons.icSeries.image.withRenderingMode(.alwaysTemplate)
        typeImageView.image = image
    }
    
    private func configureYearLabel() {
        yearLabel.text = viewModel?.year
    }
    
    private func configureYearImageView() {
        guard let year = viewModel?.year else { return }
        guard let convertYear = Int(year) else { return }

        let image = convertYear <= 2000 ? Asset.Icons.icOld.image : Asset.Icons.icNew.image
        yearImageView.image = image
    }
    
    private func configureShareButton() {
        shareButton.setImage(UIImage(asset: Asset.Icons.icShare), for: .normal)
        shareButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension MovieCell {
    
    @objc
    func shareTapped() {
        delegate?.movieCellShareButtonTapped(title: viewModel?.title)
    }
}
