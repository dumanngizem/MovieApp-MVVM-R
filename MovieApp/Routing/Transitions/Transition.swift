//
//  Transition.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import Foundation
import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
