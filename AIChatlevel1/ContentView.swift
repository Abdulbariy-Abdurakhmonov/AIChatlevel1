//
//  ContentView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 13/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Bro!")
            Text("we did it")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
