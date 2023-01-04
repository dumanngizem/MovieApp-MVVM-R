//
//  BaseNavigationController.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import UIKit
import UIComponents

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        interactivePopGestureRecognizer?.delegate = nil
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func configureContents() {
        let attributed: [NSAttributedString.Key: Any] = [ .foregroundColor: UIColor.white]
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            let backButtonAppearance = UIBarButtonItemAppearance()
            backButtonAppearance.normal.titleTextAttributes = attributed
            
            appearance.backButtonAppearance = backButtonAppearance
            appearance.backgroundColor = .black.withAlphaComponent(0.8)
            appearance.titleTextAttributes = attributed
            appearance.largeTitleTextAttributes = attributed

            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().barTintColor = .red
            UINavigationBar.appearance().isTranslucent = false
        }

    }
}
