//
//  TextIndicatorView.swift
//  UIComponents
//
//  Created by Gizem Duman on 16.11.2022.
//

import UIKit

public class TextIndicatorView: UIView {
    
    private let containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.4)
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public func setView(totalPage: Int, currentPage: Int) {
        self.countLabel.text = "\(currentPage)/\(totalPage)"
    }
}

// MARK: - UILayout
extension TextIndicatorView {
    
    private func addSubViews() {
        addContainerView()
        addCountLabel()
    }
    
    private func addContainerView() {
        addSubview(containerView)
        containerView.edgesToSuperview()
    }
    
    private func addCountLabel() {
        containerView.addSubview(countLabel)
        countLabel.centerInSuperview()
    }
}

// MARK: - ConfigureContents
extension TextIndicatorView {
    
    private func configureContents() {
        
    }
}
