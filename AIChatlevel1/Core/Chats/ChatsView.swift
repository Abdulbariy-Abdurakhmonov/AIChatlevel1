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
                    Text(chat.id)
                }
            }
            .navigationTitle("Chat")
        }
    }
}

#Preview {
    ChatsView()
}
