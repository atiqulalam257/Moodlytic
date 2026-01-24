//
//  RegisterUseCaseImpl.swift
//  Moodlytic
//
//  Created by Atiq Alam on 18/01/26.
//


final class RegisterUseCaseImpl: RegisterUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(email: String, password: String, gender: Gender) async throws {
        guard !email.isEmpty else { throw AppError.emptyEmail }
        guard password.count >= 6 else { throw AppError.weakPassword }

        try await repository.register(
            email: email,
            password: password,
            gender: gender
        )
    }
}