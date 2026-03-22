//
//  AppViewBuilder.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 21/03/26.
//

import SwiftUI

struct AppViewBuilder<TabbarView: View, OnboardingView: View>: View {
    
    var showTapBar: Bool = false
    @ViewBuilder var tabbarView: TabbarView
    @ViewBuilder var onboardingView: OnboardingView
    
    var body: some View {
        ZStack {
            if showTapBar {
                tabbarView
                    .transition(.move(edge: .trailing))
            } else {
                onboardingView
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showTapBar)
    }
}

private struct PreviewView: View {
    @State private var showTapBar: Bool = true
    
    var body: some View {
        AppViewBuilder(
            showTapBar: showTapBar,
            tabbarView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Tab Bar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
        .onTapGesture {
            showTapBar.toggle()
        }
    }
}

#Preview {
    PreviewView()
}
