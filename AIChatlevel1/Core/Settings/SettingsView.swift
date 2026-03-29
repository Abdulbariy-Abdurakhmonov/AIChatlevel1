//
//  SettingsView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 28/03/26.
//

import SwiftUI

struct SettingsView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState

    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutPressed()
                } label: {
                    Text("Sing out")
                }

            }
            .navigationTitle("Settings")
        }
    }

    func onSignOutPressed() {
        // do some logic to sign out the user
        dismiss()

        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateViewState(showTapBarView: false)
        }

    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
