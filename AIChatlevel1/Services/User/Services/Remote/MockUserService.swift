//
//  MockUserService.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 05/06/26.
//

import Foundation

struct MockUserService: RemoteUserService {

    let user: UserModel?

    init(user: UserModel? = nil) {
        self.user = user
    }

    func saveUsers(user: UserModel) async throws {

    }
    
    func streamUser(userId: String) async throws -> AsyncThrowingStream<UserModel, any Error> {
        AsyncThrowingStream { continuation in
            if let user {
                continuation.yield(user)
            }
        }
    }
    
    func deleteUser(userId: String) async throws {

    }
    
    func markOnboardingCompleted(userId: String, profileColorHex: String) async throws {

    }

}
