//
//  ProfileModalView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 19/05/26.
//

import SwiftUI

struct ProfileModalView: View {

    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "Alien"
    var onXmarkPressed: () -> Void = { }
    
    var body: some View {
        VStack(spacing: 0) {
            if let imageName {
                ImageLoaderView(urlString: imageName)
                    .aspectRatio(1, contentMode: .fit)
            }
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.thinMaterial)
        .cornerRadius(16)
        .overlay(
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundStyle(.black)
                .padding(4)
                .tappableBackground()
                .anyButton {
                    onXmarkPressed()
                }
                .padding(8)
            ,alignment: .topTrailing
        )
    }
}




#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()

        ProfileModalView()
            .padding(40)
    }
}
