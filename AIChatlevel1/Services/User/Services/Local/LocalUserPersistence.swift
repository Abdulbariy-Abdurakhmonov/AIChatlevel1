//
//  LocalUserPersistence.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 05/06/26.
//

import Foundation

protocol LocalUserPersistence {
    func getCurrentUser() -> UserModel?
    func saveCurrentUser(user: UserModel?) throws
}
