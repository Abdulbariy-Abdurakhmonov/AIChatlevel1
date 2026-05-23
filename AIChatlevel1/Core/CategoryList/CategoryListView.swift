//
//  CategoryListView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 22/05/26.
//

import SwiftUI

struct CategoryListView: View {

    @Binding var path: [NavigationPathOptions]
    var category: CharacterOption = .alien
    var imageName: String = Constants.randomImage
    @State private var avatars: [AvatarModel] = AvatarModel.mocks

    var body: some View {
        List {
            CategoryCellView(
                title: category.plural.capitalized,
                image: imageName,
                font: .largeTitle,
                cornerRadius: 0
            )
            .removeListRowFormatting()

                ForEach(avatars, id: \.self) { avatar in
                    CustomCellView(
                        imageName: avatar.profileImageName,
                        title: avatar.name,
                        subtitle: avatar.characterDescription
                    )
                    .anyButton(.highlight, action: {
                        onAvatarPressed(avatar: avatar)
                    })
                    .removeListRowFormatting()
                }

        }
        .ignoresSafeArea()
        .listStyle(PlainListStyle())
    }
    private func onAvatarPressed(avatar: AvatarModel) {
        path.append(.chat(avatarId: avatar.avatarId))
    }
}

#Preview {
    CategoryListView(path: .constant([]))
}
