//
//  ChatRowCellView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 04/04/26.
//

import SwiftUI

struct ChatRowCellView: View {

    var imageName: String? = Constants.randomImage
    var headLine: String? = "Alpha"
    var subheadline: String? = "This is the last message in the chat!"
    var hasNewChat: Bool = true

    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                        .aspectRatio(1, contentMode: .fit)

                } else {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.5))
                }
            }
            .frame(width: 60, height: 60)
            .clipShape(Circle())

            VStack(alignment: .leading, spacing: 8) {
                if let headLine {
                    Text(headLine)
                        .font(.headline)
                }
                
                if let subheadline {
                    Text(subheadline)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            if hasNewChat {
                Text("NEW")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(Color.blue)
                    .cornerRadius(6)
            }

        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(Color(uiColor: .systemBackground))



    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()

        List {
            ChatRowCellView()
                .removeListRowFormatting()
            ChatRowCellView(hasNewChat: false)
                .removeListRowFormatting()
            ChatRowCellView(imageName: nil)
                .removeListRowFormatting()
            ChatRowCellView(headLine: nil, hasNewChat: false)
                .removeListRowFormatting()
            ChatRowCellView(subheadline: nil, hasNewChat: false)
                .removeListRowFormatting()
        }


    }
}
