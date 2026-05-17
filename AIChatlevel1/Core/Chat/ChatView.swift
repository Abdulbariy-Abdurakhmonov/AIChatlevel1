//
//  ChatView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 15/05/26.
//

import SwiftUI

struct ChatView: View {

    @State private var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State private var avatar: AvatarModel? = .mock
    @State private var currentUser: UserModel? = .mock

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(chatMessages) { message in
                        let isCurrentuser = message.authodId == currentUser?.userId
                        ChatBubbleViewBuilder(
                            message: message,
                            isCurrentUser: isCurrentuser,
                            imageName: isCurrentuser ? nil : avatar?.profileImageName
                        )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(8)
            }

            Rectangle()
                .frame(height: 50)

                .navigationTitle(avatar?.name ?? "Chat")
                .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
