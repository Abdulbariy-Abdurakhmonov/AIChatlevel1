//
//  CustomCellView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 02/04/26.
//

import SwiftUI

struct CustomCellView: View {

    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "An Alien that is smiling in the park"

    var body: some View {
        HStack {

            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                } else {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.5))
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .frame(height: 60)
            .cornerRadius(16)

            VStack(alignment: .leading, spacing: 4){
                if let title {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                }

                if let subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }

            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
        .padding(12)
        .padding(.vertical, 4)
        .background(Color(uiColor: .systemBackground))

    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()

        VStack {
            CustomCellView(imageName: nil)
            CustomCellView()
        }
    }

}
