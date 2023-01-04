//
//  CleanNavigationController.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import UIKit
import UIComponents

class CleanNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        interactivePopGestureRecognizer?.delegate = nil
    }
    
    private func configureContents() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor = .red
    }
}
