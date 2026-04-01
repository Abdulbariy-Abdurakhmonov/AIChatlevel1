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
    let characterLocation: CharacterLoaction?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?

    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLoaction? = nil,
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
            AvatarModel(avatarId: UUID().uuidString, name: "Gamma", characterOption: .car, characterAction: .working, characterLocation: .airport, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avatarId: UUID().uuidString, name: "Delta", characterOption: .woman, characterAction: .laughing, characterLocation: .mall, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now)
        ]
    }

}

struct AvatarDescriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLoaction

    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLoaction) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }

    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }

    var characterDescription: String {
        "A \(characterOption.rawValue) that is \(characterAction.rawValue) on a \(characterLocation.rawValue)"
    }

}

enum CharacterOption: String {
    case man, woman, dog, car, alien

    static var `default`: Self {
        .man
    }
}

enum CharacterAction: String {
    case eating, crying, laughing, sleeping, playing, working, walking, shopping, dancing, relaxing, drinking

    static var `default`: Self {
        .eating
    }
}

enum CharacterLoaction: String {
    case park, office, home, beach, forest, city, mountain, mall, museum, library, hospital, school, church, subway, train, airport, space, moon, star, galaxy, ocean, desert, jungle, circus, zoo

    static var `default`: Self {
        .forest
    }
}
