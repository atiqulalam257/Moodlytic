//
//  HomeViewModel.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import Foundation
import SwiftUI
import Combine

@MainActor
final class HomeViewModel: ObservableObject {

    // MARK: - Published properties
    @Published var todayDate: String = ""
    @Published var selectedMood: Mood = .neutral
    @Published var journalText: String = ""
    @Published var aiResponse: String?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    // MARK: - Use Cases
    private let saveUseCase: SaveJournalEntryUseCase
    private let aiUseCase: GenerateAIResponseUseCase

    // MARK: - Init
    init(
        saveUseCase: SaveJournalEntryUseCase = AppContainer.shared.saveJournalUseCase,
        aiUseCase: GenerateAIResponseUseCase = AppContainer.shared.generateAIUseCase
    ) {
        self.saveUseCase = saveUseCase
        self.aiUseCase = aiUseCase
        self.todayDate = Self.formatDate(Date())
    }

    // MARK: - Actions
    func selectMood(_ mood: Mood) {
        selectedMood = mood
    }

    func submitJournal() async {
        
        guard !journalText.isEmpty else {
            errorMessage = "Please enter your journal."
            return
        }

        let mood = selectedMood


        isLoading = true
        errorMessage = nil

        let entry = JournalEntry(
            id: UUID(),
            date: Date(),
            mood: mood,
            text: journalText,
            aiResponse: nil
        )

        do {
            try await saveUseCase.execute(entry: entry)

            let response = try await aiUseCase.execute(
                text: journalText,
                mood: mood
            )
            aiResponse = response

        } catch let error as AppError {
            errorMessage = error.errorDescription ?? "Something went wrong."
        } catch {
            errorMessage = "Unexpected error occurred."
        }

        isLoading = false
    }

    // MARK: - Private
    private static func formatDate(_ date: Date) -> String {
        DateFormatter.fullDate.string(from: date)
    }
}


