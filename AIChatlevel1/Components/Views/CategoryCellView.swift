//
//  CategoryCellView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 02/04/26.
//

import SwiftUI

struct CategoryCellView: View {

    var title: String = "Alien"
    var image: String = Constants.randomImage
    var font: Font = .title2
    var cornerRadius: CGFloat = 16

    var body: some View {

        ImageLoaderView(urlString: image, resizingMode: .fit)
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .bottomLeading, content: {
                Text(title)
                    .font(font)
                    .fontWeight(.semibold)
                    .padding(16)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .addingGredientBackgroundForText()
            })
            .cornerRadius(cornerRadius)

    }
}

#Preview {
    VStack {
        CategoryCellView()
            .frame(width: 150)
        CategoryCellView()
            .frame(width: 300)
        CategoryCellView()
            .frame(width: 100)
    }
}
