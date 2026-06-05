//
//  AppView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 21/03/26.
//

import SwiftUI

struct AppView: View {

    @State var appState: AppState = AppState()
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager

    var body: some View {
        AppViewBuilder(
            showTapBar: appState.showTapBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
        .task {
            await checkUserStatus()
        }
        .onChange(of: appState.showTapBar) {_, showTapBar in
            if !showTapBar {
                Task {
                    await checkUserStatus()
                }
            }
        }
    }

    private func checkUserStatus() async {
        if let user = authManager.auth {
            // User is Authenticated
            print("User is already authenticated. \(user.uid)")

            do {
                try await userManager.logIn(auth: user, isNewUser: false)
            } catch {
                print("Failed to log in to auth for existing user: \(error)")
                try? await Task.sleep(for: .seconds(3))
                await checkUserStatus()
            }

        } else {
            // User is not Authenticated
            do {
                let result = try await authManager.signInAnonymously()
                print("Sign in Anonymously success: \(result.user.uid)")
                try await userManager.logIn(auth: result.user, isNewUser: result.isNewUser)
            } catch {
                print("Failed to log in anonymously and log in: \(error)")
                try? await Task.sleep(for: .seconds(3))
                await checkUserStatus()
            }
        }
    }
}

#Preview("AppView - tabbar") {
    AppView(appState: AppState(showTapBar: true))
        .environment(UserManager(services: MockUserServices(user: .mock)))
        .environment(AuthManager(service: MockAuthService(user: .mock())))
}
#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTapBar: false))
        .environment(UserManager(services: MockUserServices(user: nil)))
        .environment(AuthManager(service: MockAuthService(user: nil)))
}
