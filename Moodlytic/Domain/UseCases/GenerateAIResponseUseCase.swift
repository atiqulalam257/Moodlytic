//
//  GenerateAIResponseUseCase.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


protocol GenerateAIResponseUseCase {
    func execute(text: String, mood: Mood) async throws -> String
}
