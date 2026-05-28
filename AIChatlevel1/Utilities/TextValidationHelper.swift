//
//  TextValidationHelper.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 17/05/26.
//

import Foundation

struct TextValidationHelper {
    
    enum TextValidationError: LocalizedError {
        case notEnoughCharacters(min: Int)
        case hasBadWords

        var errorDescription: String? {
            switch self {
            case .notEnoughCharacters(min: let min):
                "Please add at least \(min) characters."
            case .hasBadWords:
                "Bad word detected. Please rephrase your message."

            }
        }
    }

    static func checkIfTextIsValid(text: String) throws {
        let minCharCount = 4
        guard text.count >= minCharCount else { throw TextValidationError.notEnoughCharacters(min: minCharCount) }

        let badWords = [
            "shit", "bitch", "ass", "stupid"
        ]
        if badWords.contains(text.lowercased()) {
            throw TextValidationError.hasBadWords
        }
    }
}
