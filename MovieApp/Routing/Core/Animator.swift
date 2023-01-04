//
//  Animator.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
