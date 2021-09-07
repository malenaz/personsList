//
//  AppDelegate.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/6/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: PersonsTableViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

