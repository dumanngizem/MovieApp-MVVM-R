//
//  Share+Extension.swift
//  Utilities
//
//  Created by Gizem Duman on 9.11.2022.
//

import Foundation
import UIKit

public extension UIViewController {
    
    func presentShare(url: URL?) {
        guard let url = url  else { return }
        let shareVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        self.present(shareVC, animated: true, completion: nil)
    }
}
