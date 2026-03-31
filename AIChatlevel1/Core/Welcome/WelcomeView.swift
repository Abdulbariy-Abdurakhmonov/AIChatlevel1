//
//  WelcomeView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 26/03/26.
//

import SwiftUI

struct WelcomeView: View {

    @State var imageName: String = Constants.randomImage

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                    ImageLoaderView(urlString: imageName)
                        .ignoresSafeArea()

                titleSection
                    .padding(.top, 24)

                ctaButtons
                    .padding(16)

                policyLinks

            }

        }
        
    }

    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("AI Chat 🤙🏼")
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text("YouTube @SwiftFulThinking")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    private var ctaButtons: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get started")
                    .callToButton()
            }

            Text("Already have an account? Sign in")
                .font(.body)
                .underline()
                .padding(8)
                .tappableBackground()
                .onTapGesture {

                }
        }
    }

    private var policyLinks: some View {
        HStack(spacing: 8) {
            Link(destination: URL(string: Constants.termsOfServiceUrl)!) {
                Text("Terms of service")
            }
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)

            Link(destination: URL(string: Constants.privacyPolicyUrl)!) {
                Text("privacy policy")
            }

        }
    }

}

#Preview {
    WelcomeView()
}
