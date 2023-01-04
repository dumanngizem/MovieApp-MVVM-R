//
//  UIView+Extensions.swift
//  UIComponents
//
//  Created by Gizem Duman on 10.11.2022.
//

import UIKit

final class ClickListener: UITapGestureRecognizer {
    private var action: () -> Void

    init(_ action: @escaping () -> Void) {
        self.action = action
        super.init(target: nil, action: nil)
        self.addTarget(self, action: #selector(execute))
    }

    @objc
    private func execute() {
        action()
    }
}

public extension UIView {
    func onTap(_ action: @escaping () -> Void) {
        self.isUserInteractionEnabled = true
        let click = ClickListener(action)
        self.addGestureRecognizer(click)
    }
}

public extension UIView {
    @discardableResult
    func addLineDashedStroke(pattern: [NSNumber]?, radius: CGFloat, color: CGColor, borderWidth: CGFloat = 2) -> CALayer {
        let borderLayer = CAShapeLayer()

        borderLayer.strokeColor = color
        borderLayer.lineDashPattern = pattern
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        borderLayer.fillColor = nil
        borderLayer.lineCap = .round
        borderLayer.path = UIBezierPath(roundedRect: bounds,
                                        byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layoutSubviews()

        layer.addSublayer(borderLayer)
        return borderLayer
    }
}
