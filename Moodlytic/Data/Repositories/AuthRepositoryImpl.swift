//
//  AuthRepositoryImpl 2.swift
//  Moodlytic
//
//  Created by Atiq Alam on 18/01/26.
//


final class AuthRepositoryImpl: AuthRepository {

    func login(email: String, password: String) async throws {
        // Mock delay
        try await Task.sleep(nanoseconds: 800_000_000)

        if email == "atiq@gmail.com" && password == "123456" {
            return
        } else {
            throw AppError.invalidCredentials
        }
    }

    func register(email: String, password: String, gender: Gender) async throws {
        try await Task.sleep(nanoseconds: 800_000_000)
    }

    func resetPassword(email: String) async throws {
        try await Task.sleep(nanoseconds: 800_000_000)
    }
}
