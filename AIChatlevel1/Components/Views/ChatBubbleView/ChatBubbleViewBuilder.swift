//
//  ChatBubbleViewBuilder.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 17/05/26.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {

    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var imageName: String?

    var body: some View {
        ChatBubbleView(
            text: message.content ?? "",
            textColor: isCurrentUser ? .white : .primary,
            backgroundColor: isCurrentUser ? .accent : Color(uiColor: .systemGray6),
            showImage: !isCurrentUser,
            imageName: imageName
        )
        .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        .padding(.leading, isCurrentUser ? 75 : 0)
        .padding(.trailing, isCurrentUser ? 0 : 75)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            ChatBubbleViewBuilder()
            ChatBubbleViewBuilder(isCurrentUser: true)
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authodId: UUID().uuidString,
                    content: "This is a longer message to test how the text wraps and adjusts its size, and goes on and on and on",
                    seenByIds: nil,
                    dateCreated: .now
                ),
                isCurrentUser: false,
                imageName: nil
            )

            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authodId: UUID().uuidString,
                    content: "This is a longer message to test how the text wraps and adjusts its size, and goes on and on and on",
                    seenByIds: nil,
                    dateCreated: .now
                ),
                isCurrentUser: true,
                imageName: nil
            )
        }
        .padding(8)
    }
}
