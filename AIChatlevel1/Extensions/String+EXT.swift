//
//  String+EXT.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 06/06/26.
//

import SwiftUI

extension String {
    var withArticle: String {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        let article = vowels.contains(self.lowercased().first ?? "x") ? "an" : "a"
        return "\(article) \(self)"
    }
}
