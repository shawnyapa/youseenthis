//
//  AppDelegate.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/5/22.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // labTesting() /// NOTE: Enable for Lab Testing when needed
        print("App Delegate didFinishLaunchingWithOptions")
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {

        print(url.absoluteString)
        return true
    }
    
    func labTesting() {

        //LabTesting.jsonTesting(userData: userData)
    }
}
