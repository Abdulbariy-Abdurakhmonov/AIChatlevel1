//
//  FileManagerUserPersistence.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 05/06/26.
//

import Foundation

struct FileManagerUserPersistence: LocalUserPersistence {
    private let userDocumentKey: String = "current_user"

    func getCurrentUser() -> UserModel? {
        try? FileManager.getDocument(key: userDocumentKey)
    }

    func saveCurrentUser(user: UserModel?) throws {
        try? FileManager.saveDocument(key: userDocumentKey, value: user)
    }

}
