//
//  AppDelegate.swift
//  MovieApp
//
//  Created by Gizem Duman on 8.11.2022.
//

import UIKit
import netfox
import FlipperKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // swiftlint:disable force_cast
    static let shared = UIApplication.shared.delegate as! AppDelegate
    // swiftlint:enable force_cast
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // MARK: - UserDefaults
        UserDefaults.standard.set(true, forKey: "user_login")
        NFX.sharedInstance().start()
        setupFlipperKit(application)
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        self.window?.makeKeyAndVisible()
        AppRouter.shared.window = window
        AppRouter.shared.startApp()
        return true
        
    }
    
}

extension AppDelegate {
    private func setupFlipperKit(_ application: UIApplication) {
        let client = FlipperClient.shared()
        // MARK: - Network
        client?.add(FlipperKitNetworkPlugin(networkAdapter: SKIOSNetworkAdapter()))
        // MARK: - Shared Preferences
        client?.add(FKUserDefaultsPlugin.init(suiteName: "user_login"))
        let layoutDescriptorMapper = SKDescriptorMapper(defaults: ())
        FlipperKitLayoutComponentKitSupport.setUpWith(layoutDescriptorMapper)
        client?.add(FlipperKitLayoutPlugin(rootNode: application, with: layoutDescriptorMapper!))
        client?.start()
    }
}
