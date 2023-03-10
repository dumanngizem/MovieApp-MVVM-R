//
//  Encodable+Exntension.swift
//  DataProvider
//
//  Created by Gizem Duman on 9.11.2022.
//

import Foundation

public extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    var data: Data? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return data
    }
}
