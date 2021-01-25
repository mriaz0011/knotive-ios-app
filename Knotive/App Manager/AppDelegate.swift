//
//  AppDelegate.swift
//  Knotive
//
//  Created by Muhammad Riaz on 30/12/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        SafeArea.top = window?.safeAreaInsets.top ?? 40.0
        SafeArea.bottom = window?.safeAreaInsets.bottom ?? 40.0
        SafeArea.left = window?.safeAreaInsets.left ?? 40.0
        SafeArea.right = window?.safeAreaInsets.right ?? 40.0
        return true
    }
}

