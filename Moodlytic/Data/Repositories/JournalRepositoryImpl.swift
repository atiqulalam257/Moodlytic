//
//  JournalRepositoryImpl.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


final class JournalRepositoryImpl: JournalRepository {

    private let localDataSource: JournalLocalDataSource
    private let aiService: AIService

    init(
        localDataSource: JournalLocalDataSource,
        aiService: AIService
    ) {
        self.localDataSource = localDataSource
        self.aiService = aiService
    }

    func save(entry: JournalEntry) async throws {
        try await localDataSource.save(entry)
    }

    func fetchAll() async throws -> [JournalEntry] {
        try await localDataSource.fetchAll()
    }

    func generateAIResponse(
        text: String,
        mood: Mood
    ) async throws -> String {
        try await aiService.generateResponse(text: text, mood: mood)
    }
}
