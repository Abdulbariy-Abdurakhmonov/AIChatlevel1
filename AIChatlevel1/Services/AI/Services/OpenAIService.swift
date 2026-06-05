//
//  OpenAIService.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 06/06/26.
//


import OpenAI
struct OpenAIService: AIService {

    var openAI: OpenAI {
        OpenAI(apiToken: Keys.openAI)
    }

    func generateImage(input: String) async throws -> UIImage {

        let query = ImagesQuery(
        prompt: input,
        model: "gpt-image-1-mini",
        n: 1,
        quality: .low,
        size: ._1024
        )

        let result = try await openAI.images(query: query)

        guard let b64Json = result.data.first?.b64Json,
                let data = Data(base64Encoded: b64Json),
              let image = UIImage(data: data) else {
            throw OpenAIError.invalidResponse
        }

        return image
    }

    enum OpenAIError: LocalizedError {
        case invalidResponse
    }

}