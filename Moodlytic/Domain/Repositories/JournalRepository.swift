//
//  JournalRepository.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


protocol JournalRepository {
    func save(entry: JournalEntry) async throws
    func fetchAll() async throws -> [JournalEntry]
    func generateAIResponse(
        text: String,
        mood: Mood
    ) async throws -> String
}
