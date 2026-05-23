//
//  ChatsView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 26/03/26.
//

import SwiftUI

struct ChatsView: View {

    @State private var chats: [ChatModel] = ChatModel.mocks
    @State private var recentAvatars: [AvatarModel] = AvatarModel.mocks

    @State private var path: [NavigationPathOptions] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                recentsSection
                chatsSection
            }
            .navigationTitle("Chat")
            .navigationDestinationForCoreModule(path: $path)
        }
    }

    @ViewBuilder
    private var recentsSection: some View {
        if !recentAvatars.isEmpty {
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8) {
                        ForEach(recentAvatars, id: \.self) { avatar in
                            if let imageName = avatar.profileImageName {
                                VStack(spacing: 8) {
                                    ImageLoaderView(urlString: imageName)
                                        .aspectRatio(1, contentMode: .fit)
                                        .clipShape(.circle)

                                    Text(avatar.name ?? "")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                .anyButton {
                                    onAvatarPressed(avatar: avatar)
                                }
                            }
                        }
                    }
                    .padding(.top, 12)
                }
                .frame(height: 120)
                .removeListRowFormatting()
            } header: {
                Text("RECENTS")
            }
        }
    }

    private var chatsSection: some View {
        Section {
            if chats.isEmpty {
                Text("Your chats will appear here!")
                    .foregroundStyle(.secondary)
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(40)
                    .removeListRowFormatting()
            } else {
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
        } header: {
            Text("CHATS")
        }

    }

    private func onChatPressed(chat: ChatModel) {
        path.append(.chat(avatarId: chat.avatarId))
    }

    private func onAvatarPressed(avatar: AvatarModel) {
        path.append(.chat(avatarId: avatar.avatarId))
    }
}

#Preview {
    ChatsView()
}
