//
//  AppDelegate.swift
//  BasicTestApplication
//
//  Created by Luan Kalume | Stone on 20/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let primary = UIColor(red: 149/255, green: 201/255, blue: 61/255, alpha: 1.0)
        ThemeManager.set(theme: primary)
        return true
    }

}
