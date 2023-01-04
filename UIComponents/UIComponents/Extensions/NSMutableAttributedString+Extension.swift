//
//  NSMutableAttributedString+Extension.swift
//  UIComponents
//
//  Created by Gizem Duman on 10.11.2022.
//

import UIKit

public extension NSMutableAttributedString {
    
    class func getAttributedString(fromString string: String) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: string)
    }
    
    func apply(attribute: [NSAttributedString.Key: Any], subString: String) {
        if let range = self.string.range(of: subString) {
            self.apply(attribute: attribute, onRange: NSRange(range, in: self.string))
        }
    }
    
    func apply(attribute: [NSAttributedString.Key: Any], onRange range: NSRange) {
        if range.location != NSNotFound {
            self.setAttributes(attribute, range: range)
        }
    }
    
    // Apply color on substring
    func apply(color: UIColor, subString: String) {
      
      if let range = self.string.range(of: subString) {
        self.apply(color: color, onRange: NSRange(range, in: self.string))
      }
    }
    
    // Apply color on given range
    func apply(color: UIColor, onRange: NSRange) {
      self.addAttributes([NSAttributedString.Key.foregroundColor: color],
                         range: onRange)
    }
}
