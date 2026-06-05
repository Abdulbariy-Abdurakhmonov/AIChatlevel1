//
//  FirebaseUserService.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 05/06/26.
//


import SwiftfulFirestore
import FirebaseFirestore

typealias ListenerRegistration = FirebaseFirestore.ListenerRegistration

struct FirebaseUserService: RemoteUserService {

    var collection: CollectionReference {
        Firestore.firestore().collection("users")
    }

    func saveUsers(user: UserModel) async throws {
        try collection.document(user.userId).setData(from: user, merge: true)
    }

    func markOnboardingCompleted(userId: String, profileColorHex: String) async throws {
        try await collection.document(userId).updateData([
            UserModel.CodingKeys.didCompleteOnboarding.rawValue: true,
            UserModel.CodingKeys.profileColorHex.rawValue: profileColorHex
        ])
    }

    func streamUser(userId: String) async throws -> AsyncThrowingStream<UserModel, Error> {
        collection.streamDocument(id: userId)
    }

    func deleteUser(userId: String) async throws {
        try await collection.document(userId).delete()
    }

}
