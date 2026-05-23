//
//  NavigationPathOptions.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 23/05/26.
//

import SwiftUI

enum NavigationPathOptions: Hashable {
    case chat(avatarId: String)
    case category(category: CharacterOption, imageName: String)
}

extension View {
    func navigationDestinationForCoreModule(path: Binding<[NavigationPathOptions]>) -> some View {
        self
            .navigationDestination(for: NavigationPathOptions.self) { newValue in
                switch newValue {
                case .chat(avatarId: let avatarId):
                    ChatView(avatarId: avatarId)
                case.category(category: let category, let imageName):
                    CategoryListView(path: path, category: category, imageName: imageName)
                }
            }
    }
}
