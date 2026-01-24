import Foundation

enum AppError: Error, LocalizedError, Equatable {

    // MARK: - Domain Errors
    case invalidMood
    case emptyJournalText
    case emptyEmail
    case weakPassword
    case invalidCredentials

    // MARK: - Data Layer Errors
    case localSaveFailed(String)
    case localFetchFailed(String)
    case aiServiceFailed(String)

    // MARK: - Generic
    case unknown

    var errorDescription: String? {
        switch self {

        case .invalidMood:
            return "The selected mood is invalid."

        case .emptyJournalText:
            return "Journal text cannot be empty."

        case .emptyEmail:
            return "Email is required."

        case .weakPassword:
            return "Password must be at least 6 characters."

        case .invalidCredentials:
            return "Invalid email or password."

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
