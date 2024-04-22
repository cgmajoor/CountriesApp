//
//  AppDelegate.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = CountriesViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

