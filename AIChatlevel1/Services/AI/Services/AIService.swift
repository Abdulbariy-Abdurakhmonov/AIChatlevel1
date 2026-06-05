//
//  AIService.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 06/06/26.
//


protocol AIService: Sendable {
    func generateImage(input: String) async throws -> UIImage
}