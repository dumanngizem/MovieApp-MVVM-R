//
//  EmptyCell.swift
//  UIComponents
//
//  Created by Gizem Duman on 17.11.2022.
//

import UIKit

public class EmptyCell: UITableViewCell, ReusableView {
    
    private let view = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }

    public var title: String? {
        didSet {
            self.titleLabel.text = title
        }
    }
}

// MARK: - UILayout
extension EmptyCell {
    
    private func addSubViews() {
        addView()
        addTitleLabel()
    }
    
    private func addView() {
        contentView.addSubview(view)
        view.edgesToSuperview()
        view.height(300)
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.edgesToSuperview()
    }
}

// MARK: - ConfigureContents
extension EmptyCell {
    
    private func configureContents() {
        selectionStyle = .none
    }
}
