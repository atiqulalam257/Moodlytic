//
//  JournalViewModel.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class JournalViewModel: ObservableObject {

    // MARK: - UI State
    @Published var text: String = ""
    @Published var mood: Mood = .neutral
    @Published var isLoading: Bool = false
    @Published var aiResponse: String?
    @Published var errorMessage: String?
    @Published var isSuccess: Bool = false

    // MARK: - Dependencies
    private let saveUseCase: SaveJournalEntryUseCase
    private let aiUseCase: GenerateAIResponseUseCase

    // MARK: - Init
    init(
            initialMood: Mood,
            saveUseCase: SaveJournalEntryUseCase = AppContainer.shared.saveJournalUseCase,
            aiUseCase: GenerateAIResponseUseCase = AppContainer.shared.generateAIUseCase
        ) {
            self.mood = initialMood
            self.saveUseCase = saveUseCase
            self.aiUseCase = aiUseCase
        }

    // MARK: - Actions
    func submit() async {
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please write something before reflecting."
            return
        }

        isLoading = true
        errorMessage = nil

        let entry = JournalEntry(
            id: UUID(),
            date: Date(),
            mood: mood,
            text: text,
            aiResponse: nil
        )

        do {
            // 1️⃣ Save journal entry
            try await saveUseCase.execute(entry: entry)

            // 2️⃣ Generate AI response
            let response = try await aiUseCase.execute(
                text: text,
                mood: mood
            )

            aiResponse = response
            isSuccess = true

        } catch let error as AppError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = "Something went wrong. Please try again."
        }

        isLoading = false
    }
    
    // ✅ RESET METHOD
        func reset() {
            text = ""
            aiResponse = nil
            errorMessage = nil
            isSuccess = false
            isLoading = false
        }
}

