//
//  UIViewController+Extensions.swift
//  Utilities
//
//  Created by Gizem Duman on 9.11.2022.
//

import UIKit

public enum ScrollToType {
    case top
    case bottom
}

public extension UIViewController {
    
    func scrollTo(scrollTo: ScrollToType) {
        switch scrollTo {
        case .bottom:
            scrollToBottom(view: view)
        case .top:
            scrollToTop(view: view)
        }
    }
    
    private func scrollToBottom(view: UIView?) {
        guard let view = view else { return }
        
        switch view {
        case let scrollView as UIScrollView:
            if scrollView.scrollsToTop == true {
                scrollView.setContentOffset(CGPoint(x: 0.0, y: scrollView.contentSize.height - scrollView.contentInset.bottom), animated: true)
                return
            }
        default:
            break
        }
        for subView in view.subviews {
            scrollToBottom(view: subView)
        }
    }
    
    private func scrollToTop(view: UIView?) {
        guard let view = view else { return }
        switch view {
        case let scrollView as UIScrollView:
            if scrollView.scrollsToTop == true {
                scrollView.setContentOffset(CGPoint(x: 0.0, y: -scrollView.contentInset.top), animated: true)
                return
            }
        default:
            break
        }
        
        for subView in view.subviews {
            scrollToTop(view: subView)
        }
    }
    
    var isScrolledToTop: Bool {
        if self is UITableViewController {
            return (self as? UITableViewController)?.tableView.contentOffset.y == 0
        }
        for subView in view.subviews {
            if let scrollView = subView as? UIScrollView {
                return (scrollView.contentOffset.y == 0)
            }
        }
        return true
    }
}

// MARK: - IsModal
public extension UIViewController {

    var isModal: Bool {

        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController

        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
}
