//
//  AppError.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import Foundation

enum AppError: Error, LocalizedError, Equatable {
    
    // Domain Errors
    case invalidMood
    case emptyJournalText
    
    // Data Layer Errors
    case localSaveFailed(String)
    case localFetchFailed(String)
    case aiServiceFailed(String)
    
    // Generic
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidMood:
            return "The selected mood is invalid."
        case .emptyJournalText:
            return "Journal text cannot be empty."
        case .localSaveFailed(let reason):
            return "Failed to save locally: \(reason)"
        case .localFetchFailed(let reason):
            return "Failed to fetch data: \(reason)"
        case .aiServiceFailed(let reason):
            return "AI service failed: \(reason)"
        case .unknown:
            return "Something went wrong."
        }
    }
}
