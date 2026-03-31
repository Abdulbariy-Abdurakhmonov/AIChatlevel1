//
//  OnboardingIntroView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 30/03/26.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            Group {
                Text("Make your own ")
                +
                Text("Avatars ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("and chat with them! \n\nHave ")
                +
                Text("real conversations ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("with AI generated responses.")

            }
            .baselineOffset(6)
            .frame(maxHeight: .infinity)
            .padding(24)

            NavigationLink {
                OnboardingColorView()
            } label: {
                Text("Continue")
                    .callToButton()
            }
        }
        .font(.title3)
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        OnboardingIntroView()
    }
}
