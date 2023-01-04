//
//  SliderImageCellModel.swift
//  UIComponents
//
//  Created by Gizem Duman on 16.11.2022.
//

import Foundation

public protocol SliderImageCellDataSource: AnyObject {
    var imageURL: URL? { get set }
}

public protocol SliderImageCellEventSource: AnyObject {
    
}

public protocol SliderImageCellProtocol: SliderImageCellDataSource, SliderImageCellEventSource {
    
}

public final class SliderImageCellModel: SliderImageCellProtocol {
    
    public var imageURL: URL?
    
    public init(imageURL: URL? = nil) {
        self.imageURL = imageURL
    }
}
