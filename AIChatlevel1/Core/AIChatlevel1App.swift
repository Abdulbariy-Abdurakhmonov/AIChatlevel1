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
                .environment(delegate.userManager)
                .environment(delegate.authManager)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {

    var authManager: AuthManager!
    var userManager: UserManager!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()

        authManager = AuthManager(service: FirebaseAuthService())
        userManager = UserManager(services: ProductionUserServices())

        return true
    }
}
