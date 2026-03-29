//
//  ProfileView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 26/03/26.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton
                    }
                }
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                }
        }
    }
    
    private var settingsButton: some View {
        Button {
            onSettingsButtonPressed()
        } label: {
            Image(systemName: "gear")
                .font(.headline)
                .foregroundStyle(.accent)
        }
    }
    
    private func onSettingsButtonPressed() {
        showSettings = true
    }
}

#Preview {
    ProfileView()
}
