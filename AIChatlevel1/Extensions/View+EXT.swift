//
//  View+EXT.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 28/03/26.
//
import SwiftUI

extension View {
    
    func callToButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .cornerRadius(16)
    }

    func tappableBackground() -> some View {
        background(Color.black.opacity(0.001))
    }

}
