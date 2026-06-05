//
//  RemoteUserService.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 05/06/26.
//
import Foundation

protocol RemoteUserService: Sendable {
    func saveUsers(user: UserModel) async throws
    func streamUser(userId: String) async throws -> AsyncThrowingStream<UserModel, Error>
    func deleteUser(userId: String) async throws
    func markOnboardingCompleted(userId: String, profileColorHex: String) async throws
}
