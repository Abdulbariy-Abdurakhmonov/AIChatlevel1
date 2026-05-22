//
//  AvatarAttributes.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 15/05/26.
//
enum CharacterOption: String, CaseIterable, Hashable {
    case man, woman, dog, cat, alien

    var plural: String {
        switch self {
        case .man:
            return "men"
        case .woman:
            return "women"
        case .dog:
            return "dogs"
        case .cat:
            return "cats"
        case .alien:
            return "aliens"

        }
    }

    static var `default`: Self {
        .man
    }
}

enum CharacterAction: String, CaseIterable, Hashable {
    case eating, crying, laughing, sleeping, playing, working, walking, shopping, dancing, relaxing, drinking

    static var `default`: Self {
        .eating
    }
}

enum CharacterLocation: String, CaseIterable, Hashable {
    case park, office, home, beach, forest, city, mountain, mall, museum, library, hospital, school, church, subway, train, airport, space, moon, star, galaxy, ocean, desert, jungle, circus, zoo

    static var `default`: Self {
        .forest
    }
}

struct AvatarDescriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLocation

    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
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
