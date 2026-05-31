//
//  UserModel.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 05/04/26.
//

import Foundation
import SwiftUI

struct UserModel: Codable {
    let userId: String
    let email: String?
    let isAnonymous: Bool?
    let creationDate: Date?
    let creationVersion: String?
    let lastSignInDate: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?

    init(
        userId: String,
        email: String? = nil,
        isAnonymous: Bool? = nil,
        creationDate: Date? = nil,
        creationVersion: String? = nil,
        lastSignInDate: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.email = email
        self.isAnonymous = isAnonymous
        self.creationDate = creationDate
        self.creationVersion = creationVersion
        self.lastSignInDate = lastSignInDate
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }

    init(auth: UserAuthInfo, creationVersion: String?) {
        self.init(
            userId: auth.uid,
            email: auth.email,
            isAnonymous: auth.isAnonymous,
            creationDate: auth.creationDate,
            creationVersion: creationVersion,
            lastSignInDate: auth.lastSignInDate
        )
    }

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case email
        case isAnonymous = "is_anonymous"
        case creationDate = "creation_date"
        case creationVersion = "creation_version"
        case lastSignInDate = "last_sign_in_date"
        case didCompleteOnboarding = "did_complete_onboarding"
        case profileColorHex = "profile_color_hex"

    }

    static var mock: Self {
        mocks[0]
    }

    var profileColorCalculated: Color {
        guard let profileColorHex else {
            return .accent
        }
        return Color(hex: profileColorHex)
    }

    static var mocks: [Self] {
        let now = Date()

        return [
            UserModel(
                userId: "user_1",
                creationDate: now.addingTimeInterval(days: -10),
                didCompleteOnboarding: true,
                profileColorHex: "#4ECDC4"
            ),
            UserModel(
                userId: "user_2",
                creationDate: now.addingTimeInterval(days: -7, hours: -3),
                didCompleteOnboarding: true,
                profileColorHex: "#FF6B6B"
            ),
            UserModel(
                userId: "user_3",
                creationDate: now.addingTimeInterval(days: -3),
                didCompleteOnboarding: false,
                profileColorHex: "#1A535C"
            ),
            UserModel(
                userId: "user_4",
                creationDate: now.addingTimeInterval(hours: -12),
                didCompleteOnboarding: nil,
                profileColorHex: "#FFE66D"
            )
        ]
    }
}
