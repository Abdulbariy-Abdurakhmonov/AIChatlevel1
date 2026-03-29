//
//  OnboardingCompletedView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 28/03/26.
//

import SwiftUI

struct OnboardingCompletedView: View {

    @Environment(AppState.self) private var root

    var body: some View {
        VStack {
            Text("Onboarding Completed!")
                .frame(maxHeight: .infinity)

            Button {
                onFinishButtonPressed()
            } label: {
                Text("Finished")
                    .callToButton()
            }
        }
        .padding(16)
    }

    func onFinishButtonPressed() {
        root.updateViewState(showTapBarView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
