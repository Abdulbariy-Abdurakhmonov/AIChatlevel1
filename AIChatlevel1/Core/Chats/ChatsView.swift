//
//  ChatsView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 26/03/26.
//

import SwiftUI

struct ChatsView: View {

    @State private var chats: [ChatModel] = ChatModel.mocks

    var body: some View {
        NavigationStack {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        chatModel: chat,
                        currentUserId: nil, // Fix me
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(2))
                            return .mock
                        },
                        getlastChatMessage: {
                            try? await Task.sleep(for: .seconds(2))
                            return .mock
                        }
                    )
                    .anyButton(.highlight, action: {
                        
                    })
                    .removeListRowFormatting()
                }
            }
            .navigationTitle("Chat")
        }
    }
}

#Preview {
    ChatsView()
}
