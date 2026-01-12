//
//  JournalEntryMapper.swift
//  Moodlytic
//
//  Created by Atiq Alam on 29/12/25.
//

import Foundation

// MARK: - Domain → DTO
extension JournalEntry {
    func toDTO() -> JournalEntryDTO {
        JournalEntryDTO(
            id: id,
            date: date,
            mood: mood.rawValue,
            text: text,
            aiResponse: aiResponse
        )
    }
}

// MARK: - DTO → Domain
extension JournalEntryDTO {
    func toDomain() -> JournalEntry {
        JournalEntry(
            id: id,
            date: date,
            mood: Mood(rawValue: mood) ?? .neutral,
            text: text,
            aiResponse: aiResponse
        )
    }
}
