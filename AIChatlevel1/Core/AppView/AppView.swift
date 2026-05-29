//
//  AppView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 21/03/26.
//

import SwiftUI

struct AppView: View {

    @State var appState: AppState = AppState()
    @Environment(\.authService) private var authService

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
        if let user = authService.getAuthenticatedUser() {
            // User is Authenticated
            print("User is already authenticated. \(user.uid)")
        } else {
            // User is not Authenticated
            do {
                let result = try await authService.signInAnonymously()
                print("Sign in Anonymously success: \(result.user.uid)")
            } catch {
                print(error)
            }
        }
    }
}

#Preview("AppView - tabbar") {
    AppView(appState: AppState(showTapBar: true))
}
#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTapBar: false))
}
