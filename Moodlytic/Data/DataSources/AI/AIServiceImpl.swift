//
//  AIServiceImpl.swift
//  Moodlytic
//
//  Created by Atiq Alam on 29/12/25.
//


import Foundation

final class AIServiceImpl: AIService {

    func generateResponse(text: String, mood: Mood) async throws -> String {
        // Mock AI response (SAFE for MVP)
        switch mood {
        case .sad:
            return "I’m really sorry you’re feeling this way. It’s okay to feel sad sometimes."
        case .neutral:
            return "Thanks for sharing. Taking a moment to reflect is a healthy habit."
        case .happy:
            return "That’s wonderful to hear! Keep embracing these positive moments."
        case .excited:
            return "It sounds like you’re in a peaceful state. That balance is valuable."
        }
    }
}
