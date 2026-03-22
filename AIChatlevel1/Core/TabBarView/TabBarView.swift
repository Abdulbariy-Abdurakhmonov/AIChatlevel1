//
//  TabBarView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 22/03/26.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationStack {
                Text("Explore")
                    .navigationTitle("Explore")
            }
            .tabItem {
                Label("Explore", systemImage: "eyes")
            }
            NavigationStack {
                Text("Chat")
                    .navigationTitle("Chat")
            }
            .tabItem {
                Label("Chat", systemImage: "bubble.left.and.bubble.right.fill")
            }
            NavigationStack {
                Text("Profile")
                    .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    TabBarView()
}
