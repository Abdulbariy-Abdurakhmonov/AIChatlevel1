//
//  FirebaseAuthServise.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 24/05/26.
//

import SwiftUI
import FirebaseAuth
import SignInAppleAsync

extension EnvironmentValues {
    @Entry var authService: FirebaseAuthServise = FirebaseAuthServise()
}

struct FirebaseAuthServise {

    func getAuthenticatedUser() -> UserAuthInfo? {
        if let user = Auth.auth().currentUser {
            return UserAuthInfo(user: user)
        }
        return nil

    }

    func signInAnonymously() async throws -> (user: UserAuthInfo, isNewUser: Bool) {
        let result = try await Auth.auth().signInAnonymously()
        return result.asAuthInfo
    }

    func signInApple() async throws -> (user: UserAuthInfo, isNewUser: Bool) {

        let helper = SignInWithAppleHelper()
        let response = try await helper.signIn()

        let credential = OAuthProvider.credential(
            providerID: AuthProviderID.apple,
            idToken: response.token,
            rawNonce: response.nonce
        )

        let result = try await Auth.auth().signIn(with: credential)
        return result.asAuthInfo
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }

    func deleteAccount() async throws {
        guard let user = Auth.auth().currentUser else {
            throw AuthError.userNotFound
        }

        try await user.delete()
    }

    enum AuthError: LocalizedError {
        case userNotFound

        var errorDescription: String? {
            switch self {
            case .userNotFound:
                return "Current authenticated user not found"
            }
        }
    }

}

extension AuthDataResult {
    var asAuthInfo: (user: UserAuthInfo, isNewUser: Bool) {
        let user = UserAuthInfo(user: user)
        let isNewUser = additionalUserInfo?.isNewUser ?? true
        return (user, isNewUser)
    }
}
