//
//  AppDelegate.swift
//  Payment2K24
//
//  Created by Aung Kyaw Phyo on 21/11/2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /// InitialViewController
        let initialViewController = LoginScreenViewController.instantiate(storyboard: .login)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
        return true
    }

}

