//
//  ChatMessageModel.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 04/04/26.
//

import Foundation

struct ChatMessageModel {
    let id: String
    let chatId: String
    let authodId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?

    init(
        id: String,
        chatId: String,
        authodId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authodId = authodId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }

    func hasBeenSeenby(userId: String) -> Bool {
        guard let seenByIds else {return false}
        return seenByIds.contains(userId)
    }

    static var mock: ChatMessageModel {
        mocks[0]
    }

    static var mocks: [ChatMessageModel] {
        let now = Date()

        return [
            ChatMessageModel(
                id: "msg_1",
                chatId: "chat_1",
                authodId: "user_1",
                content: "Hey, how are you?",
                seenByIds: ["user_2"],
                dateCreated: now.addingTimeInterval(hours: -2)
            ),
            ChatMessageModel(
                id: "msg_2",
                chatId: "chat_1",
                authodId: "user_2",
                content: "I'm good, what about you?",
                seenByIds: ["user_1"],
                dateCreated: now.addingTimeInterval(hours: -1, minutes: -45)
            ),
            ChatMessageModel(
                id: "msg_3",
                chatId: "chat_2",
                authodId: "user_3",
                content: "Did you finish the task?",
                seenByIds: nil,
                dateCreated: now.addingTimeInterval(hours: -5)
            ),
            ChatMessageModel(
                id: "msg_4",
                chatId: "chat_3",
                authodId: "user_4",
                content: "Let's meet tomorrow",
                seenByIds: ["user_1", "user_2"],
                dateCreated: now.addingTimeInterval(days: -1, hours: -2)
            )
        ]
    }
}
