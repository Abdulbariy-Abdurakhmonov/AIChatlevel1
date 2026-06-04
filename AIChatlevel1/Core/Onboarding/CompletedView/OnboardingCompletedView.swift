//
//  OnboardingCompletedView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 28/03/26.
//

import SwiftUI

struct OnboardingCompletedView: View {

    @Environment(AppState.self) private var root
    @Environment(UserManager.self) private var userManager
    var selectedColor: Color = .orange
    @State private var isCompletingProfileSetup: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Setup completed!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)

            Text("We've set up your profile and you're ready to start chatting.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)

        }
        
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            ctaButton
        }
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)

    }

    private var ctaButton: some View {

        AsyncCallToActionButton(
            isLoading: isCompletingProfileSetup,
            action: onFinishButtonPressed,
            title: "Finish"
        )
    }

    func onFinishButtonPressed() {
        isCompletingProfileSetup = true
        Task {
            let hex = selectedColor.asHex()
            try await userManager.markOnboardingCompleteForCurrentUser(profileColorHex: hex)

            // dismiss
            isCompletingProfileSetup = false
            root.updateViewState(showTapBarView: true)
        }

    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        .environment(UserManager(service: MockUserService()))
        .environment(AppState())
}
