//
//  AsyncCallToActionButton.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 15/05/26.
//

import SwiftUI

struct AsyncCallToActionButton: View {

//    @Binding var isLoading: Bool
    var isLoading: Bool
    var action: () -> Void
    var title: String

    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .tint(.white)
            } else {
                Text(title)

            }
        }
        .callToButton()
        .anyButton(.press, action: {
            action()
        })
        .disabled(isLoading)
    }
}

private struct PreviewView: View {
    @State private var isLoading: Bool = false

    var body: some View {
        AsyncCallToActionButton(
            isLoading: isLoading,
            action: {
                isLoading = true

                Task {
                    try? await Task.sleep(for: .seconds(2))
                    isLoading = false
                }
            },
            title: "Finish"
        )
    }
}

#Preview {
    PreviewView()
        .padding()
}
