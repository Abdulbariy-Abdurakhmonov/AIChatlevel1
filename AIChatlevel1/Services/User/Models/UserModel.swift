//
//  UserModel.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 05/04/26.
//

import Foundation
import SwiftUI

struct UserModel {
    let userId: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?

    init(
        userId: String,
        dateCreated: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
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
                dateCreated: now.addingTimeInterval(days: -10),
                didCompleteOnboarding: true,
                profileColorHex: "#4ECDC4"
            ),
            UserModel(
                userId: "user_2",
                dateCreated: now.addingTimeInterval(days: -7, hours: -3),
                didCompleteOnboarding: true,
                profileColorHex: "#FF6B6B"
            ),
            UserModel(
                userId: "user_3",
                dateCreated: now.addingTimeInterval(days: -3),
                didCompleteOnboarding: false,
                profileColorHex: "#1A535C"
            ),
            UserModel(
                userId: "user_4",
                dateCreated: now.addingTimeInterval(hours: -12),
                didCompleteOnboarding: nil,
                profileColorHex: "#FFE66D"
            )
        ]
    }
}
