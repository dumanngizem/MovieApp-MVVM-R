//
//  ModalNavigationController.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import UIKit

class ModalNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        interactivePopGestureRecognizer?.delegate = nil
    }
    
    private func configureContents() {
        if #available(iOS 13.0, *) {
            let barAppearance = UINavigationBarAppearance()
            barAppearance.backgroundColor = .lightGray
            
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.isTranslucent = true
            
            navigationBar.tintColor = .red
            navigationBar.standardAppearance = barAppearance
            navigationBar.scrollEdgeAppearance = barAppearance
            navigationBar.layoutIfNeeded()
            
        } else {
            navigationController?.navigationBar.barTintColor = .white
            navigationController?.navigationBar.tintColor = .blue
            navigationController?.navigationBar.isTranslucent = false
            navigationItem.title = title
        }
    }
}
