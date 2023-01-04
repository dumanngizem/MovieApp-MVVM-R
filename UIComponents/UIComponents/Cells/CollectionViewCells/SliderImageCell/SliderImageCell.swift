//
//  SliderImageCell.swift
//  UIComponents
//
//  Created by Gizem Duman on 16.11.2022.
//

import UIKit
import TinyConstraints

public class SliderImageCell: UICollectionViewCell, ReusableView {
    
    private let movieImageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    weak var viewModel: SliderImageCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }

    public func set(viewModel: SliderImageCellProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
}

// MARK: - UILayout
extension SliderImageCell {
    
    private func addSubViews() {
        contentView.addSubview(movieImageView)
        movieImageView.edgesToSuperview()
    }
}

// MARK: - ConfigureContents
extension SliderImageCell {
    
    private func configureContents() {
        guard let image = viewModel?.imageURL else { return }
        movieImageView.kf.setImage(with: image)
    }
}
