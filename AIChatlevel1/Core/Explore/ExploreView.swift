//
//  ExploreView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 26/03/26.
//

import SwiftUI

struct ExploreView: View {

    let avatar = AvatarModel.mock
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases
    @State private var popularAvatars: [AvatarModel] = AvatarModel.mocks

    @State private var path: [NavigationPathOptions] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                featuredSection
                categorySection
                popularSection

            }
            .navigationTitle("Explore")
            .navigationDestinationForCoreModule(path: $path)
        }
    }

    private var featuredSection: some View {
        Section {
            ZStack {
                CarouselView(items: AvatarModel.mocks) { item in
                    HeroCellView(
                        title: item.name,
                        subtitle: item.characterDescription,
                        imageName: item.profileImageName
                    )
                    .anyButton(.plain) {
                        onAvatarPressed(avatar: avatar)
                    }
                }
            }
            .removeListRowFormatting()
        } header: {
            Text("Featured")

        }

    }

    private var categorySection: some View {
        Section {
            ZStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            let imageName = popularAvatars.first(where: {$0.characterOption == category})?.profileImageName
                            if let imageName {
                                CategoryCellView(
                                    title: category.plural.capitalized,
                                    image: Constants.randomImage
                                )
                                .anyButton(.plain) {
                                    onCategoryPressed(category: category, imageName: imageName)
                                }
                            }

                        }
                    }

                }
                .frame(height: 140)
                .scrollIndicators(.hidden)
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
            }
            .removeListRowFormatting()
        } header: {
            Text("Categories")

        }
    }

    private var popularSection: some View {
        Section {
            ForEach(popularAvatars, id: \.self) { avatar in
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
        } header: {
            Text("Popular")

        }
    }

    private func onAvatarPressed(avatar: AvatarModel) {
        path.append(.chat(avatarId: avatar.avatarId))
    }

    private func onCategoryPressed(category: CharacterOption, imageName: String) {
        path.append(.category(category: category, imageName: Constants.randomImage))
    }
}

#Preview {
    ExploreView()
}
