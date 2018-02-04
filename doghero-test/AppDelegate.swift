//
//  AppDelegate.swift
//  doghero-test
//
//  Created by Gustavo Romito Nogueira on 1/27/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainRouter: MainRouter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //load window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        //load main router
        mainRouter = MainRouter(window: window)
        
        //run router
        mainRouter?.loadRootController()
        
        return true
    }

}

