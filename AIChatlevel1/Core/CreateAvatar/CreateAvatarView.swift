//
//  CreateAvatarView.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 15/05/26.
//

import SwiftUI

struct CreateAvatarView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(AIManager.self) private var aiManager

    @State private var avatarName: String = ""
    @State private var characterOption: CharacterOption = .default
    @State private var characterAction: CharacterAction = .default
    @State private var characterLocation: CharacterLocation = .default

    @State private var isGenerating: Bool = false
    @State private var isSaving: Bool = false
    @State private var generatedImage: UIImage?

    var body: some View {
        NavigationStack {
            List {
                nameSection
                atrebutesSection
                imageSection
                saveSection
            }
            .navigationTitle("Create Avatar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
        }
    }

    private var backButton: some View {
        Image(systemName: "xmark")
            .font(.title3)
            .fontWeight(.semibold)
            .anyButton(.plain) {
                dismiss()
            }
    }

    private var nameSection: some View {
        Section {
            TextField("Player 1", text: $avatarName)
        } header: {
            Text("Name your avatar *")
        }
    }

    private var atrebutesSection: some View {

        Section {
            Picker(selection: $characterOption) {
                ForEach(CharacterOption.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            } label: {
                Text("It's \(characterOption.article)...")
            }

            Picker(selection: $characterAction) {
                ForEach(CharacterAction.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            } label: {
                Text("That is...")
            }

            Picker(selection: $characterLocation) {
                ForEach(CharacterLocation.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            } label: {
                Text("In the...")
            }

        } header: {
            Text("Atrebutes")
        }
    }

    private var imageSection: some View {
        Section {
            HStack(alignment: .top, spacing: 8) {
                ZStack {
                    Text("Generate Image")
                        .underline()
                        .foregroundStyle(.accent)
                        .anyButton(.plain) {
                            onGenerateButtonPressed()
                        }
                        .opacity(isGenerating ? 0 : 1)

                    ProgressView()
                        .tint(.accent)
                        .opacity(isGenerating ? 1 : 0)
                }
                .disabled(isGenerating || avatarName.isEmpty)

                Circle()
                    .fill(Color.secondary.opacity(0.3))
                    .overlay {
                        ZStack {
                            if let generatedImage {
                                Image(uiImage: generatedImage)
                                    .resizable()
                                    .scaledToFill()
                            }

                        }

                    }
                    .clipShape(.circle)
            }
            .removeListRowFormatting()
        }
        .padding(.horizontal, 8)
    }

    private func onGenerateButtonPressed() {
        isGenerating = true

        Task {
            do {
                let prompt = AvatarDescriptionBuilder(
                    characterOption: characterOption,
                    characterAction: characterAction,
                    characterLocation: characterLocation
                )
                    .characterDescription
                generatedImage = try await aiManager.generateImage(input: prompt)
            } catch {
                print("Error generating image: \(error)")
            }
            
            isGenerating = false
        }
    }

    private func onSavePressed() {
        isSaving = true

        Task {
            try? await Task.sleep(for: .seconds(3))
            dismiss()

            isSaving = false
        }
    }

    private var saveSection: some View {
        Section {
            AsyncCallToActionButton(
                isLoading: isSaving,
                action: onSavePressed,
                title: "Save"
            )
        }
        .removeListRowFormatting()
        .padding(.top, 10)
        .opacity(generatedImage == nil ? 0.5 : 1.0)
        .disabled(generatedImage == nil)
    }
}

#Preview {
    CreateAvatarView()
        .environment(AIManager(service: MockAIService()))
}
