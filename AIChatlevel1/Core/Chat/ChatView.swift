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
    @State private var textFieldText: String = ""
    @State private var showProfileView: Bool = false

    @State private var showAlert: AnyAppAlert?
    @State private var showChatSettings: AnyAppAlert?

    @State private var scrollPosition: String?

    var avatarId: String = AvatarModel.mock.avatarId
    
    var body: some View {
        VStack(spacing: 0) {

            scrollViewSection
            textFieldSection
        }
        .showModal(showModal: $showProfileView, content: {
            if let avatar {
                profileModal(avatar: avatar)
            }
        })
        .navigationTitle(avatar?.name ?? "Chat")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis")
                    .padding(8)
                    .anyButton {
                        onChatSettingPressed()
                    }
            }
        }
        .showCustomAlert(type: .confirmationDialog, alert: $showChatSettings)
        .showCustomAlert(alert: $showAlert)

    }

    private func profileModal(avatar: AvatarModel) -> some View {
        ProfileModalView(
            imageName: avatar.profileImageName,
            title: avatar.name,
            subtitle: avatar.characterOption?.rawValue.capitalized,
            onXmarkPressed: {
                showProfileView = false
            }
        )
        .padding(40)
        .transition(.slide)
    }

    private var textFieldSection: some View {
        TextField("Say something...", text: $textFieldText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .padding(12)
            .padding(.trailing, 55)
            .overlay(
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(.accent)
                    .padding(.trailing, 4)
                    .anyButton(.plain, action: {
                        onSendMessagePressed()
                    })
                , alignment: .trailing
            )

            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(uiColor: .systemBackground))

                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                }

            )
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(uiColor: .secondarySystemBackground))
    }

    private func onSendMessagePressed() {
        guard let currentUser else { return }

        let content = textFieldText

        do {
            try TextValidationHelper.checkIfTextIsValid(text: content)
            let message = ChatMessageModel(
                id: UUID().uuidString,
                chatId: UUID().uuidString,
                authodId: currentUser.userId,
                content: content,
                seenByIds: nil,
                dateCreated: .now
            )
            chatMessages.append(message)
            scrollPosition = message.id
            textFieldText = ""
        } catch {
            showAlert = AnyAppAlert(error: error)
        }

    }

    private func onChatSettingPressed() {
        showChatSettings = AnyAppAlert(
            title: "",
            subtitle: "What would you like to do?",
            buttons: {
                AnyView(
                    Group {
                        Button("Report Chat / User", role: .destructive) {

                        }
                        Button("Delete Chat", role: .destructive) {

                        }

                    }
                )
            }
        )
    }

    private var scrollViewSection: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(chatMessages) { message in
                    let isCurrentuser = message.authodId == currentUser?.userId
                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: isCurrentuser,
                        imageName: isCurrentuser ? nil : avatar?.profileImageName,
                        onImagePressed: onAvatarImagePressed
                    )
                    .id(message.id)
                }
            }
            .rotationEffect(.degrees(180))
            .frame(maxWidth: .infinity)
            .padding(8)
        }
        .rotationEffect(.degrees(180))
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.default, value: chatMessages.count)
        .animation(.default, value: scrollPosition)
    }

    private func onAvatarImagePressed() {
        showProfileView = true
    }

}

#Preview {
    NavigationStack {
        ChatView()
    }
}
