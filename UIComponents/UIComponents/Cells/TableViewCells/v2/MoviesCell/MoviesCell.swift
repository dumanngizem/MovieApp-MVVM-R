//
//  MoviesCell.swift
//  UIComponents
//
//  Created by Gizem Duman on 23.12.2022.
//

import UIKit

public class MoviesCell: UITableViewCell, ReusableView {
    
    weak var viewModel: MoviesCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: MoviesCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
