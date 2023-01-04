//
//  SliderCellModel.swift
//  UIComponents
//
//  Created by Gizem Duman on 15.11.2022.
//

import Foundation

public protocol SliderCellDataSource: AnyObject {
    var cellItems: [SliderImageCellProtocol]? { get set }
    var numberOfItemsInSection: Int? { get }
    
    func cellForItemAt(indexPath: IndexPath) -> SliderImageCellProtocol?
}

public protocol SliderCellEventSource: AnyObject {
    
}

public protocol SliderCellProtocol: SliderCellDataSource, SliderCellEventSource {
    
}

public final class SliderCellModel: SliderCellProtocol {
    
    public var cellItems: [SliderImageCellProtocol]?
    
    public init(cellItems: [SliderImageCellProtocol]? = nil) {
        self.cellItems = cellItems
    }
}

// MARK: - DataSource
extension SliderCellModel {
    
    public var numberOfItemsInSection: Int? {
        return cellItems?.count ?? 0
    }
    
    public func cellForItemAt(indexPath: IndexPath) -> SliderImageCellProtocol? {
        return cellItems?[indexPath.row]
    }
}
