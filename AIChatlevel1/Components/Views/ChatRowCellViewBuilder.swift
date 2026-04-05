//
//  ChatRowCellViewBuilder.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 04/04/26.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {

    var chatModel: ChatModel = .mock
    var currentUserId: String? = ""
    var getAvatar: () async -> AvatarModel?
    var getlastChatMessage: () async -> ChatMessageModel?

    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?
    @State private var didLoadAvatar: Bool = false
    @State private var didLoadChatMessage: Bool = false

    private var isLoading: Bool {
        if didLoadAvatar && didLoadChatMessage {
            return false
        }
        return true
    }

    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else {return false}
        return lastChatMessage.hasBeenSeenby(userId: currentUserId)
    }

    private var subheadline: String? {
        if isLoading {
            return "xxx xxx xxx xxx"
        }
        if avatar == nil && lastChatMessage == nil {
            return "Error"
        }
        return lastChatMessage?.content
    }

    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headLine: isLoading ? "xxx xxx" : avatar?.name,
            subheadline: subheadline,
            hasNewChat: isLoading ? false : hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            lastChatMessage = await getlastChatMessage()
            didLoadChatMessage = true
        }
    }

}

#Preview {
    VStack {
        ChatRowCellViewBuilder(chatModel: .mock) {
            try? await Task.sleep(for: .seconds(3))
            return .mock
        } getlastChatMessage: {
            try? await Task.sleep(for: .seconds(3))
            return .mock
        }

        ChatRowCellViewBuilder(chatModel: .mock) {
            return .mock
        } getlastChatMessage: {
            return .mock
        }

        ChatRowCellViewBuilder(chatModel: .mock) {
            nil
        } getlastChatMessage: {
            nil
        }
    }
}
