//
//  ChatsView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 26/03/26.
//

import SwiftUI

struct ChatsView: View {

    @State private var chats: [ChatModel] = ChatModel.mocks

    @State private var path: [NavigationPathOptions] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        chatModel: chat,
                        currentUserId: nil, // Fix me
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(2))
                            return AvatarModel.mocks.randomElement()!
                        },
                        getlastChatMessage: {
                            try? await Task.sleep(for: .seconds(2))
                            return ChatMessageModel.mocks.randomElement()!
                        }
                    )
                    .anyButton(.highlight, action: {
                        onChatPressed(chat: chat)
                    })
                    .removeListRowFormatting()
                }
            }
            .navigationTitle("Chat")
            .navigationDestinationForCoreModule(path: $path)
        }
    }

    private func onChatPressed(chat: ChatModel) {
        path.append(.chat(avatarId: chat.avatarId))
    }
}

#Preview {
    ChatsView()
}
