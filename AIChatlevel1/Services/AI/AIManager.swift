//
//  AIManager.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 05/06/26.
//

import SwiftUI

@MainActor
@Observable
class AIManager {
    private let service: AIService

    init(service: AIService) {
        self.service = service
    }

    func generateImage(input: String) async throws -> UIImage {
        try await service.generateImage(input: input)
    }

}

