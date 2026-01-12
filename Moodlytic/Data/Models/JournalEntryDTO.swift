//
//  JournalEntryDTO.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import Foundation

struct JournalEntryDTO: Codable {

    let id: UUID
    let date: Date
    let mood: String
    let text: String
    let aiResponse: String?
}
