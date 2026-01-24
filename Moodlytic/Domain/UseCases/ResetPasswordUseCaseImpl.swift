//
//  ResetPasswordUseCaseImpl.swift
//  Moodlytic
//
//  Created by Atiq Alam on 18/01/26.
//


final class ResetPasswordUseCaseImpl: ResetPasswordUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(email: String) async throws {
        guard !email.isEmpty else { throw AppError.emptyEmail }
        try await repository.resetPassword(email: email)
    }
}