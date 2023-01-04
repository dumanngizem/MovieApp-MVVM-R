//
//  PopToRoute.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import Foundation

protocol PopToRootRoute {
    func popToRoot(isAnimated: Bool)
}

extension PopToRootRoute where Self: RouterProtocol {
    func popToRoot(isAnimated: Bool = true) {
        guard let navigationController = viewController?.navigationController else {
            return
        }
        navigationController.popToRootViewController(animated: isAnimated)
    }
}
