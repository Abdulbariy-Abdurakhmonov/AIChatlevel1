//
//  AppView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 21/03/26.
//

import SwiftUI

struct AppView: View {

//    @AppStorage("showTapBarView") var showTapBar: Bool = false
    @State var appState: AppState = AppState()

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
    }
}

#Preview("AppView - tabbar") {
    AppView(appState: AppState(showTapBar: true))
}
#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTapBar: false))
}
