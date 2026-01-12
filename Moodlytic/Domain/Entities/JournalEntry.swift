//
//  JournalEntry.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//

import Foundation


struct JournalEntry:Identifiable {
    let id: UUID
    let date: Date
    let mood: Mood
    let text: String
    let aiResponse: String?
}
