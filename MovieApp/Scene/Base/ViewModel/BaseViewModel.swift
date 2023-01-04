//
//  BaseViewModel.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import Foundation
import UIComponents

protocol BaseViewModelDataSource: AnyObject {
}

protocol BaseViewModelEventSource: AnyObject {
    
    // MARK: - Loading
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    
    // MARK: - TryAgainButton
    var showTryAgain: VoidClosure? { get set }
    var hideTryAgain: VoidClosure? { get set }
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func tryAgainButtonTapped()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    // MARK: - TryAgainButton
    var showTryAgain: VoidClosure?
    var hideTryAgain: VoidClosure?
    
    // MARK: - Loading
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    
    let router: R
    let dataProvider: DataProviderProtocol?
    
    init(router: R, dataProvider: DataProviderProtocol = apiDataProvider) {
        self.router = router
        self.dataProvider = dataProvider
    }
    
    func tryAgainButtonTapped() {}
            
    #if DEBUG || DEVELOP
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}
