//
//  AppDelegate.swift
//  template-proj
//
//  Created by Pedro Nadolny on 26/02/20.
//  Copyright © 2020 template. All rights reserved.
//

import UIKit
import Home
import Core

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        return true
    }
}
