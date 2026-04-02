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

    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categorySection
                popularSection

            }
            .navigationTitle("Explore")
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
                            CategoryCellView(
                                title: category.rawValue.capitalized,
                                image: Constants.randomImage
                            )
                            .anyButton(.plain) {

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
            ForEach(popularAvatars, id: \.self) { item in
                CustomCellView(
                    imageName: item.profileImageName,
                    title: item.name,
                    subtitle: item.characterDescription
                )
                .anyButton(.highlight, action: {

                })
                .removeListRowFormatting()
            }
        } header: {
            Text("Popular")

        }
    }
}

#Preview {
    ExploreView()
}
