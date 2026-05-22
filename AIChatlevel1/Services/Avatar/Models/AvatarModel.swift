//
//  AvatarModel.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 01/04/26.
//

import Foundation

struct AvatarModel: Hashable {
    let avatarId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?

    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }

    var characterDescription: String {
        AvatarDescriptionBuilder(avatar: self).characterDescription
    }

    static var mock: AvatarModel {
        mocks[0]
    }

    static var mocks: [AvatarModel] {
        [
            AvatarModel(avatarId: UUID().uuidString, name: "Alfa", characterOption: .alien, characterAction: .crying, characterLocation: .galaxy, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avatarId: UUID().uuidString, name: "Beta", characterOption: .dog, characterAction: .playing, characterLocation: .park, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avatarId: UUID().uuidString, name: "Gamma", characterOption: .cat, characterAction: .working, characterLocation: .airport, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avatarId: UUID().uuidString, name: "Delta", characterOption: .woman, characterAction: .laughing, characterLocation: .mall, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now)
        ]
    }

}

