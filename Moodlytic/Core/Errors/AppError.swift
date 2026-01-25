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
            return StringHelper.invalidMood.localized

        case .emptyJournalText:
            return StringHelper.emptyJournalText.localized

        case .emptyEmail:
            return StringHelper.emptyEmail.localized

        case .weakPassword:
            return StringHelper.weakPassword.localized

        case .invalidCredentials:
            return StringHelper.invalidCredentials.localized

        case .localSaveFailed(let reason):
            let format = StringHelper.localSaveFailed.localized
            return String(format: format, reason)

        case .localFetchFailed(let reason):
            let format = StringHelper.localFetchFailed.localized
            return String(format: format, reason)

        case .aiServiceFailed(let reason):
            let format = StringHelper.aiServiceFailed.localized
            return String(format: format, reason)

        case .unknown:
            return StringHelper.unknown.localized
        }
    }
}

