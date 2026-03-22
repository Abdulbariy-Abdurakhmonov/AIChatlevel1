//
//  AppView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 21/03/26.
//

import SwiftUI

struct AppView: View {
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
    AppView()
}
