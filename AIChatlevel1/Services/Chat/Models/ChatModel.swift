//
//  ChatModel.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 04/04/26.
//

import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date

    init(id: String, userId: String, avatarId: String, dateCreated: Date, dateModified: Date) {
        self.id = id
        self.userId = userId
        self.avatarId = avatarId
        self.dateCreated = dateCreated
        self.dateModified = dateModified
    }

    static var mock: ChatModel {
        mocks[0]
    }

    static var mocks: [ChatModel] {
        let now = Date()

        return [
            ChatModel(
                id: "mock_chat_1",
                userId: "user_1",
                avatarId: "avatar_1",
                dateCreated: now.addingTimeInterval(hours: -1),
                dateModified: now
            ),
            ChatModel(
                id: "mock_chat_2",
                userId: "user_2",
                avatarId: "avatar_2",
                dateCreated: now.addingTimeInterval(hours: -3, minutes: -20),
                dateModified: now.addingTimeInterval(hours: -1)
            ),
            ChatModel(
                id: "mock_chat_3",
                userId: "user_3",
                avatarId: "avatar_3",
                dateCreated: now.addingTimeInterval(days: -1),
                dateModified: now.addingTimeInterval(hours: -5)
            ),
            ChatModel(
                id: "mock_chat_4",
                userId: "user_4",
                avatarId: "avatar_4",
                dateCreated: now.addingTimeInterval(days: -2, hours: -4),
                dateModified: now.addingTimeInterval(days: -1)
            )
        ]
    }

}
