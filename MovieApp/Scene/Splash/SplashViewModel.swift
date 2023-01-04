//
//  SplashViewModel.swift
//  MovieApp
//
//  Created by Gizem Duman on 13.11.2022.
//

import Foundation

protocol SplashViewDataSource {}

protocol SplashViewEventSource {}

protocol SplashViewProtocol: SplashViewDataSource, SplashViewEventSource {
    func viewDidLoad()
    func fetchHomeView()
}

final class SplashViewModel: BaseViewModel<SplashRouter>, SplashViewProtocol {
    
    func viewDidLoad() {
        fetchHomeView()
    }
}

// MARK: - Requests
extension SplashViewModel {
    
    func fetchHomeView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            self.router.pushHome()
        }
    }
}
