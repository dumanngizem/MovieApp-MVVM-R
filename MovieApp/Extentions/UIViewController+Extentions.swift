//
//  UIViewController+Extentions.swift
//  MovieApp
//
//  Created by Gizem Duman on 13.11.2022.
//

import UIKit

extension UIViewController {
    func share(items: [Any]) {
        let activity = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(activity, animated: true)
    }
}
