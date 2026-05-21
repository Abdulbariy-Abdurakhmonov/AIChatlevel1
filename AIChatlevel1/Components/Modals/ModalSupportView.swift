//
//  ModalSupportView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 21/05/26.
//

import SwiftUI

struct ModalSupportView<Content: View>: View {

    @ViewBuilder var content: Content
    @Binding var showModal: Bool

    var body: some View {
        ZStack {
            if showModal {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .transition(AnyTransition(.opacity.animation(.smooth)))
                    .onTapGesture {
                        showModal = false
                    }

                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()

            }
        }
        .zIndex(9999)
        .animation(.easeInOut, value: showModal)
    }
}

#Preview {
    ModalSupportView()
}
