//
//  Int+Extension.swift
//  Utilities
//
//  Created by Gizem Duman on 9.11.2022.
//

import Foundation

public extension Int {
    
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
