//
//  AIChatlevel1App.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 13/03/26.
//

import SwiftUI
import FirebaseCore

@main
struct AIChatlevel1App: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
