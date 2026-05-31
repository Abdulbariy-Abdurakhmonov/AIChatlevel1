//
//  UserManager.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 30/05/26.
//

import Foundation
import FirebaseFirestore
import SwiftfulUtilities

protocol UserService: Sendable {
    func saveUsers(user: UserModel) async throws
}

struct FirebaseUserService: UserService {

    var collection: CollectionReference {
        Firestore.firestore().collection("users")
    }

    func saveUsers(user: UserModel) async throws {
        try collection.document(user.userId).setData(from: user, merge: true)
    }
}

@MainActor
@Observable
class UserManager {

    private let service: UserService
    private(set) var currentUser: UserModel?

    init(service: UserService) {
        self.service = service
        self.currentUser = nil
    }

    func logIn(auth: UserAuthInfo, isNewUser: Bool) async throws {

        let creationVersion = isNewUser ? Utilities.appVersion : nil
        let user = UserModel(auth: auth, creationVersion: creationVersion)

        try await service.saveUsers(user: user)
    }


}
