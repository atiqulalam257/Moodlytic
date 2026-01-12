//
//  AIService.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


protocol AIService {
    func generateResponse(text: String, mood: Mood) async throws -> String
}
