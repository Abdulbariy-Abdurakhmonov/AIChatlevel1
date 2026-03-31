//
//  OnboardingColorView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 30/03/26.
//

import SwiftUI

struct OnboardingColorView: View {

    let profileColors: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]
    @State private var selectedColor: Color?

    var body: some View {
        ScrollView {
            colorGrid
                .padding(.horizontal, 24)
        }
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 12) {
            ZStack {
                if let selectedColor {
                    ctaButton(selectedColor: selectedColor)
                        .transition(.move(edge: .bottom))
                }

            }
            .padding(24)
            .background(Color(uiColor: .systemBackground))
        }
        .animation(.bouncy, value: selectedColor)
        .toolbar(.hidden, for: .navigationBar)

    }

    private var colorGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: .sectionHeaders,
            content: {
                Section(content: {
                    ForEach(profileColors, id: \.self) { color in
                        Circle()
                            .fill(.accent)
                            .overlay {
                                color
                                    .clipShape(Circle())
                                    .padding(selectedColor == color ? 10 : 0)
                            }
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }, header: {
                    Text("Select a profile color")
                })
            })
    }

    private func ctaButton(selectedColor: Color) -> some View {
        NavigationLink {
            OnboardingCompletedView(selectedColor: selectedColor)
        } label: {
            Text("Continue")
                .callToButton()
        }
    }
    
}

#Preview {
    NavigationStack {
        OnboardingColorView()
    }
    .environment(AppState())
}
