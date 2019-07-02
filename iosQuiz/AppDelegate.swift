//
//  AppDelegate.swift
//  iosQuiz
//
//  Created by Marko Barisic on 10/04/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        if let _ = UserDefaults.standard.string(forKey: "token") {
            window?.rootViewController = TabBarViewController()
        } else {
            window?.rootViewController = LoginInScreenViewController()
        }
        window?.makeKeyAndVisible()
        return true
    }
}

