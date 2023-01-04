//
//  Formatter+Extension.swift
//  Utilities
//
//  Created by Gizem Duman on 9.11.2022.
//

import Foundation

public extension Formatter {
    
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter
    }()
}
