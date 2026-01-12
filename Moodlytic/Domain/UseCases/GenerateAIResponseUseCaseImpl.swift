//
//  GenerateAIResponseUseCaseImpl.swift
//  Moodlytic
//
//  Created by Atiq Alam on 29/12/25.
//


import Foundation

final class GenerateAIResponseUseCaseImpl: GenerateAIResponseUseCase {

    private let repository: JournalRepository

    init(repository: JournalRepository) {
        self.repository = repository
    }

    func execute(text: String, mood: Mood) async throws -> String {
        try await repository.generateAIResponse(
            text: text,
            mood: mood
        )
    }
}
