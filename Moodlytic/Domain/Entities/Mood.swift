//
//  Mood.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


enum Mood: String, CaseIterable, Codable {
    case sad
    case neutral
    case happy
    case excited

    var emoji: String {
        switch self {
        case .sad: return "😞"
        case .neutral: return "😐"
        case .happy: return "🙂"
        case .excited: return "😄"
        }
    }
}

