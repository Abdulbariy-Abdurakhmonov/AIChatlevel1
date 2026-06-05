//
//  UserManager.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 30/05/26.
//

import Foundation
import SwiftfulUtilities
internal import FirebaseFirestoreInternal

@MainActor
@Observable
class UserManager {

    private let remote: RemoteUserService
    private let local: LocalUserPersistence

    private(set) var currentUser: UserModel?
    private var currentUserListener: ListenerRegistration?

    init(services: UserServices) {
        self.remote = services.remote
        self.local = services.local
        self.currentUser = local.getCurrentUser()
    }

    func logIn(auth: UserAuthInfo, isNewUser: Bool) async throws {

        let creationVersion = isNewUser ? Utilities.appVersion : nil
        let user = UserModel(auth: auth, creationVersion: creationVersion)
        try await remote.saveUsers(user: user)
        addCurrentUserListener(userId: auth.uid)
    }

    func addCurrentUserListener(userId: String) {
        currentUserListener?.remove()

        Task {
            do {
                for try await value in try await remote.streamUser(userId: userId) {
                    self.currentUser = value
                    self.saveCurrentUserLocally()
                    print("Successfully listened to user: \(value.userId)")
                }
            } catch {
                print("Error attaching the user \(error)")
            }
        }
    }

    func saveCurrentUserLocally() {
        Task {
            do {
                try local.saveCurrentUser(user: currentUser)
                print("Success saving current user locally.")
            } catch {
                print("Error saving current user locally: \(error)")
            }
        }
    }

    func markOnboardingCompleteForCurrentUser(profileColorHex: String) async throws {
        let uid = try currentUserId()
        try await remote.markOnboardingCompleted(userId: uid, profileColorHex: profileColorHex)
    }

    func signOut() {
        currentUserListener?.remove()
        currentUserListener = nil
        currentUser = nil

    }

    func deleteCurrentUser() async throws {
        let uid = try currentUserId()
        try await self.remote.deleteUser(userId: uid)
        signOut()
    }

    private func currentUserId() throws -> String {
        guard let uid = currentUser?.userId else {
            throw UserManagerError.noUserId
        }
        return uid
    }

    enum UserManagerError: LocalizedError {
        case noUserId
    }

}
