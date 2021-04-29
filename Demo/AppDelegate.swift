//
//  AppDelegate.swift
//  Demo
//
//  Created by MacBookPro on 29/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
            let rootViewController:ViewController = Storyboards.Main.instance.instantiateViewController(withIdentifier: StoryBoardID.initialView) as! ViewController
        self.window?.rootViewController = rootViewController
        return true
    }
}

