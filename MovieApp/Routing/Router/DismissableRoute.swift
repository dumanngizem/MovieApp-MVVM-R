//
//  DismissableRoute.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import Foundation
import Utilities

protocol Dismissable {
    func dismiss(isAnimated: Bool, completion: VoidClosure?)
}

extension Dismissable where Self: RouterProtocol {
    func dismiss(isAnimated: Bool = true, completion: VoidClosure? = nil) {
        guard let viewController = viewController else {
            assertionFailure("Nothing to close.")
            return
        }
        viewController.dismiss(animated: isAnimated, completion: completion)
    }
}
