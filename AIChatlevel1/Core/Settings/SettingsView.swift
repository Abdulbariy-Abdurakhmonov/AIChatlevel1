//
//  SettingsView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 28/03/26.
//

import SwiftUI
import SwiftfulUtilities

struct SettingsView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.authService) private var authService
    @Environment(AppState.self) private var appState
    @State private var isPremium: Bool = false
    @State private var isAnonymousUser: Bool = false
    @State private var showCreateAccountView: Bool = false

    var body: some View {
        NavigationStack {
            List {
                accountSection
                purchaseSection
                applicationSection
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showCreateAccountView, onDismiss: {
                setAnonymousAccountStatus()
            }, content: {
                CreateAccountView()
                    .presentationDetents([.medium])
            })
            .onAppear {
                setAnonymousAccountStatus()
            }
        }
    }

    private var purchaseSection: some View {
        Section {
            HStack(spacing: 8) {
                Text("Account status: \(isPremium ? "PREMIUM" : "FREE")")
                Spacer(minLength: 0)
                if isPremium {
                    Text("MANAGE")
                        .badgeButton()
                }
            }
            .rowFormatting()
            .anyButton(.highlight, action: {

            })
            .removeListRowFormatting()
            .disabled(!isPremium)

        } header: {
            Text("Purchases")
        }
    }

    private var accountSection: some View {
        Section {
            if isAnonymousUser {
                Text("Save and back-up account")
                    .rowFormatting()
                    .anyButton(.highlight) {
                        onAccountCreatePressed()
                    }
                    .removeListRowFormatting()
            } else {
                Text("Sign out")
                    .rowFormatting()
                    .anyButton(.highlight) {
                        onSignOutPressed()
                    }
                    .removeListRowFormatting()
            }

            Text("Delete account")
                .foregroundStyle(.red)
                .rowFormatting()
                .anyButton(.highlight) {
                    onDeleteAccountPressed()
                }
                .removeListRowFormatting()

        } header: {
            Text("Account")
        }
    }

    private var applicationSection: some View {
        Section {
            HStack(spacing: 8) {
                Text("Version")
                Spacer(minLength: 0)
                Text(Utilities.appVersion ?? "")
                    .foregroundStyle(.secondary)
            }
            .rowFormatting()
            .removeListRowFormatting()

            HStack(spacing: 8) {
                Text("Build Number")
                Spacer(minLength: 0)
                Text(Utilities.buildNumber ?? "")
                    .foregroundStyle(.secondary)
            }
            .rowFormatting()
            .removeListRowFormatting()

            Text("Contact us")
                .foregroundStyle(.blue)
                .rowFormatting()
                .anyButton(.highlight, action: {

                })
                .removeListRowFormatting()

        } header: {
            Text("Aplication")
        } footer: {
            Text("Created by Abdulboriy iOS Developer.\nLearn more at https://abdulboriy.com")
                .baselineOffset(6)
        }
    }

    func setAnonymousAccountStatus() {
        isAnonymousUser = authService.getAuthenticatedUser()?.isAnonymous == true
    }

    func onSignOutPressed() {
        Task {
            do {
                try authService.signOut()
               await dismissScreen()
            } catch {
                
            }
        }



    }

    func dismissScreen() async {
        dismiss()
        try? await Task.sleep(for: .seconds(1))
        appState.updateViewState(showTapBarView: false)
    }

    func onDeleteAccountPressed() {

    }

    func onAccountCreatePressed() {
        showCreateAccountView = true
    }
}

fileprivate extension View {

    func rowFormatting() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
