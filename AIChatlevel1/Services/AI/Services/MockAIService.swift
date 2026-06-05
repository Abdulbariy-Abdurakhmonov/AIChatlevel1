//
//  MockAIService.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 06/06/26.
//

import SwiftUI

struct MockAIService: AIService {
    func generateImage(input: String) async throws -> UIImage {
        try await Task.sleep(for: .seconds(3))
        return UIImage(systemName: "apple.logo")!
    }
}
