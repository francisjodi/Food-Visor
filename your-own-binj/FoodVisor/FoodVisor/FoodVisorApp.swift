//
//  FoodVisorApp.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 21/04/2022.
//

import SwiftUI

@main
struct FoodVisorApp: App {
    
    @UIApplicationDelegateAdaptor(MyNewsBlogAppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FoodVisorService())
        }
    }
}
