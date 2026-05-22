//
//  ModalSupportView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 21/05/26.
//

import SwiftUI

struct ModalSupportView<Content: View>: View {

    @Binding var showModal: Bool
    @ViewBuilder var content: Content

    var body: some View {
        ZStack {
            if showModal {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .transition(AnyTransition(.opacity.animation(.smooth)))
                    .onTapGesture {
                        showModal = false
                    }
                    .zIndex(1)

                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .zIndex(2)

            }
        }
        .zIndex(9999)
        .animation(.easeInOut, value: showModal)
    }
}

extension View {
    func showModal(showModal: Binding<Bool>, @ViewBuilder content: () -> some View) -> some View {
        self
            .overlay(
                ModalSupportView(showModal: showModal) {
                    content()
                }
            )
    }
}

struct PreViewView: View {
    @State private var showModal: Bool = false
    var body: some View {
        Button("Show Modal") {
            showModal = true
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .showModal(showModal: $showModal) {
            RoundedRectangle(cornerRadius: 30)
                .padding(.horizontal, 40)
                .frame(width: 400, height: 400)
                .onTapGesture {
                    showModal = false
                }
                .transition(.slide)
        }
    }
}

#Preview {
    PreViewView()
}
