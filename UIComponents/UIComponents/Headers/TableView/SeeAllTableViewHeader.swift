//
//  SeeAllTableViewHeader.swift
//  UIComponents
//
//  Created by Gizem Duman on 14.11.2022.
//

import UIKit

public protocol SeeAllTableViewHeaderDelegate: AnyObject {
    func seeAllButtonTapped() 
}

public class SeeAllTableViewHeader: UIView {
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private let seeAllButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.appBlue, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
        
    public weak var delegate: SeeAllTableViewHeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    public var buttonText: String? {
        didSet {
            seeAllButton.setTitle(buttonText, for: .normal)
        }
    }
}

// MARK: - UILayout
extension SeeAllTableViewHeader {
    
    private func addSubViews() {
        addTitleLabel()
        addSeeAllButton()
    }
    
    private func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.centerYToSuperview()
        titleLabel.leadingToSuperview(offset: 20)
    }
    
    private func addSeeAllButton() {
        addSubview(seeAllButton)
        seeAllButton.centerY(to: titleLabel)
        seeAllButton.trailingToSuperview(offset: 20)
    }
}

// MARK: - ConfigureContents
extension SeeAllTableViewHeader {
    
    private func configureContents() {
        configureSeeAllButton()
    }
    
    private func configureSeeAllButton() {
        seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension SeeAllTableViewHeader {
    
    @objc
    func seeAllButtonTapped() {
        delegate?.seeAllButtonTapped()
        print("SERCAN KAYA")
    }
}
