//
//  BaseViewController.swift
//  MovieApp
//
//  Created by Gizem Duman on 10.11.2022.
//

import UIKit
import UIComponents
import TinyConstraints

class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
    
    private var animatedPopController = true
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        subscribeLoading()
    }
    
    private func configureContents() {
        self.tabBarController?.tabBar.isTranslucent = true
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        view.backgroundColor = .white
    }
    
    @objc
    func tryAgainButtonTapped() {
        viewModel.tryAgainButtonTapped()
    }
    
    @objc
    private func popController() {
        navigationController?.popViewController(animated: animatedPopController)
    }
    
#if DEBUG || DEVELOP
    deinit {
        debugPrint("deinit \(self)")
    }
#endif
}

// MARK: - Loading
extension BaseViewController {
    
    private func subscribeLoading() {
        viewModel.showLoading = {
            let window = UIApplication.shared.windows.first
            //window?.showNytLoaderView()
        }
        viewModel.hideLoading = {
            let window = UIApplication.shared.windows.first
            //window?.hideNytLoaderView()
        }
    }
}
