//
//  SetRootViewControllerTransition.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import UIKit

class SetRootViewControllerTransition: NSObject {

    var animator: Animator?
    var isAnimated: Bool = true
    var completionHandler: (() -> Void)?

    weak var viewController: UIViewController?

    init(animator: Animator? = nil, isAnimated: Bool = true) {
        self.animator = animator
        self.isAnimated = isAnimated
    }
}

// MARK: - Transition
extension SetRootViewControllerTransition: Transition {

    func open(_ viewController: UIViewController) {
        self.viewController?.navigationController?.delegate = self
        self.viewController?.navigationController?.setViewControllers([viewController], animated: true)
    }

    func close(_ viewController: UIViewController) {
        viewController.navigationController?.dismiss(animated: isAnimated, completion: completionHandler)
    }
}

// MARK: - UINavigationControllerDelegate
extension SetRootViewControllerTransition: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        completionHandler?()
    }

    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else {
            return nil
        }
        if operation == .push {
            animator.isPresenting = true
            return animator
        } else {
            animator.isPresenting = false
            return animator
        }
    }
}
