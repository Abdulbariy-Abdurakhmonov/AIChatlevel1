//
//  Keys.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 05/06/26.
//

import Foundation

struct Keys {

    static let openAI = Bundle.main.infoDictionary?["OPENAI_API_KEY"] as? String ?? ""
}

