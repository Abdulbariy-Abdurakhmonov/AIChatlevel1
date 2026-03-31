//
//  OnboardingCompletedView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 28/03/26.
//

import SwiftUI

struct OnboardingCompletedView: View {

    @Environment(AppState.self) private var root
    var selectedColor: Color = .orange
    @State private var isCompletingProfileSetup: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 6){
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
            Button {
                onFinishButtonPressed()
            } label: {
                ZStack {
                    if isCompletingProfileSetup {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Text("Finished")
                    }
                }
                .callToButton()
            }
            .disabled(isCompletingProfileSetup)
        }
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)

    }

    func onFinishButtonPressed() {
        isCompletingProfileSetup = true
        Task {
            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
            root.updateViewState(showTapBarView: true)
        }

    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        .environment(AppState())
}
