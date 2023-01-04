//
//  Url+Extensions.swift
//  Utilities
//
//  Created by Gizem Duman on 9.11.2022.
//

import Foundation
import UIKit

public extension URL {
    
    func openURL() {
        if UIApplication.shared.canOpenURL(self) {
            UIApplication.shared.open(self)
        }
    }
}
