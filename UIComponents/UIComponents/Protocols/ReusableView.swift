//
//  ReusableView.swift
//  UIComponents
//
//  Created by Gizem Duman on 10.11.2022.
//

import UIKit

public class ReusableViewModel {
    public init() {
        
    }
}

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
