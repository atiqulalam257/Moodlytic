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
            return Language.invalidMood.localized

        case .emptyJournalText:
            return Language.emptyJournalText.localized

        case .emptyEmail:
            return Language.emptyEmail.localized

        case .weakPassword:
            return Language.weakPassword.localized

        case .invalidCredentials:
            return Language.invalidCredentials.localized

        case .localSaveFailed(let reason):
            let format = Language.localSaveFailed.localized
            return String(format: format, reason)

        case .localFetchFailed(let reason):
            let format = Language.localFetchFailed.localized
            return String(format: format, reason)

        case .aiServiceFailed(let reason):
            let format = Language.aiServiceFailed.localized
            return String(format: format, reason)

        case .unknown:
            return Language.unknown.localized
        }
    }
}

