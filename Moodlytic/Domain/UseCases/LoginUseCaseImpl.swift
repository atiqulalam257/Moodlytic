//
//  LoginUseCaseImpl.swift
//  Moodlytic
//
//  Created by Atiq Alam on 18/01/26.
//


final class LoginUseCaseImpl: LoginUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(email: String, password: String) async throws {

        guard !email.isEmpty else {
            throw AppError.emptyEmail
        }

        guard password.count >= 6 else {
            throw AppError.weakPassword
        }

        try await repository.login(email: email, password: password)
    }
}
