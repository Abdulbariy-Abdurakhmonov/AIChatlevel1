//
//  MockUserPersistence.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 05/06/26.
//

import Foundation

struct MockUserPersistence: LocalUserPersistence {

    let currentUser: UserModel?

    init(user: UserModel? = nil) {
        self.currentUser = user
    }

    func getCurrentUser() -> UserModel? {
        currentUser
    }
    
    func saveCurrentUser(user: UserModel?) throws {

    }
}
