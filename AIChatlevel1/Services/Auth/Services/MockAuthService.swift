//
//  MockAuthService.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 29/05/26.
//

import SwiftUI

struct MockAuthService: AuthService {

    let currectUser: UserAuthInfo?

    init(user: UserAuthInfo? = nil) {
        self.currectUser = user
    }

    func getAuthenticatedUser() -> UserAuthInfo? {
        currectUser
    }
    
    func signInAnonymously() async throws -> (user: UserAuthInfo, isNewUser: Bool) {
        let user = UserAuthInfo.mock(isAnonymous: true)
        return (user, true)
    }
    
    func signInApple() async throws -> (user: UserAuthInfo, isNewUser: Bool) {
        let user = UserAuthInfo.mock(isAnonymous: false)
        return (user, false)
    }
    
    func signOut() throws {

    }
    
    func deleteAccount() async throws {

    }
}
