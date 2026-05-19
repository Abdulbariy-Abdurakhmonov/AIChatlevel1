//
//  ChatBubbleView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 17/05/26.
//

import SwiftUI

struct ChatBubbleView: View {

    var text: String = "This is a sample text"
    var textColor: Color = .primary
    var backgroundColor: Color = Color(uiColor: .systemGray6)
    var showImage: Bool = true
    var imageName: String?
    var onImagePressed: (() -> Void)?

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if showImage {
                ZStack {
                    if let imageName {
                        ImageLoaderView(urlString: imageName)
                            .anyButton {
                                onImagePressed?()
                            }
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }
                }
                .frame(width: 45, height: 45)
                .clipShape(.circle)
            }

            Text(text)
                .font(.body)
                .foregroundStyle(textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(backgroundColor)
                .cornerRadius(8)
        }
        .padding(.bottom, 14)

    }
}

#Preview {
    ScrollView {
        VStack(spacing: 8) {
            ChatBubbleView()
            ChatBubbleView(text: "This is very long text that will be truncated. This is very long text that will be truncated. This is very long text that will be truncated.")
            ChatBubbleView(
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil
            )
            ChatBubbleView(
                text: "This is very long text that will be truncated. This is very long text that will be truncated. This is very long text that will be truncated.",
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil
            )
        }
        .padding(8)
    }

}
