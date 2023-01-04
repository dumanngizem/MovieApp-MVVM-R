//
//  PageIndicatorView.swift
//  UIComponents
//
//  Created by Gizem Duman on 16.11.2022.
//

import UIKit

public class PageIndicatorView: UIView {
    
    private let indicator = UIPageControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public var numberOfPages: Int = 0 {
        didSet {
            indicator.numberOfPages = numberOfPages
        }
    }
    
    public var currentPage: Int = 0 {
        didSet {
            indicator.currentPage = currentPage
        }
    }
}

// MARK: - UILayout
extension PageIndicatorView {
    
    private func addSubViews() {
        addSubview(indicator)
        indicator.centerInSuperview()
    }
}

// MARK: - ConfigurContents
extension PageIndicatorView {
    
    private func configureContents() {
        indicator.layer.cornerRadius = 16
        indicator.backgroundColor = .black.withAlphaComponent(0.6)
        indicator.isUserInteractionEnabled = false
    }
}
