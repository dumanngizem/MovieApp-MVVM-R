//
//  VerticalMovieCell.swift
//  UIComponents
//
//  Created by Gizem Duman on 17.11.2022.
//

import UIKit

public class VerticalMovieCell: UICollectionViewCell, ReusableView {
    
    private let movieImageView: UIImageView = {
       let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    
    private let imdbLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
  
    
    weak var viewModel: VerticalMovieCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public func set(viewModel: VerticalMovieCellProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
    
}

// MARK: - UILayout
extension VerticalMovieCell {
    
    private func addSubViews() {
        addMovieImageView()
        addTitleLabel()
        addYearLabel()
        addImdbLabel()
    }
    
    private func addMovieImageView() {
        contentView.addSubview(movieImageView)
        movieImageView.edgesToSuperview(excluding: .bottom)
        movieImageView.height(150)
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.topToBottom(of: movieImageView, offset: 4)
        titleLabel.leading(to: movieImageView)
        titleLabel.trailing(to: movieImageView)
    }
    
    private func addYearLabel() {
        contentView.addSubview(yearLabel)
        yearLabel.topToBottom(of: titleLabel, offset: 4)
        yearLabel.leading(to: titleLabel)
        yearLabel.trailing(to: titleLabel)
    }
    
    private func addImdbLabel() {
        contentView.addSubview(imdbLabel)
        imdbLabel.topToBottom(of: yearLabel, offset: 4)
        imdbLabel.trailing(to: yearLabel)
        imdbLabel.leading(to: yearLabel)
        imdbLabel.bottomToSuperview(offset: -4)
    }
}

// MARK: - ConfigureContents
extension VerticalMovieCell {
    
    private func configureContents() {
        configureMovieImageView()
        configureTitleLabel()
        configureYearLabel()
        configureImdbLabel()
    }
    
    private func configureMovieImageView() {
        guard let image = viewModel?.imageUrl else { return }
        movieImageView.kf.setImage(with: image)
    }
   
    private func configureTitleLabel() {
        titleLabel.text = viewModel?.title
    }
    
    private func configureYearLabel() {
        yearLabel.text = viewModel?.year
    }
    
    private func configureImdbLabel() {
        imdbLabel.text = viewModel?.imdb
    }
}
