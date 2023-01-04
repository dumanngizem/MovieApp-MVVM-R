//
//  NotificationCenter+Extensions.swift
//  Utilities
//
//  Created by Gizem Duman on 9.11.2022.
//

import Foundation
public extension NotificationCenter {
    
    static func addNotification(_ observer: Any, name: Notification.Name, selector: Selector, object: Any? = nil) {
        self.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    
    static func removeNotification(_ observer: Any, name: Notification.Name, object: Any? = nil) {
        self.default.removeObserver(observer, name: name, object: object)
    }
    
    static func postNotification(_ name: Notification.Name, object: Any? = nil, userInfo: [AnyHashable: Any]? = nil) {
        self.default.post(name: name, object: object, userInfo: userInfo)
    }
    
}

