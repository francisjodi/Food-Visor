//
//  FoodVisorAppDelegate.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 22/04/2022.
//

import UIKit
import Firebase
import Foundation

class MyNewsBlogAppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
