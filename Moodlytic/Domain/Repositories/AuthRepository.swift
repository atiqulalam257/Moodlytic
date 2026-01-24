//
//  AuthRepository.swift
//  Moodlytic
//
//  Created by Atiq Alam on 18/01/26.
//


protocol AuthRepository {
    func login(email: String, password: String) async throws
    func register(email: String, password: String, gender: Gender) async throws
    func resetPassword(email: String) async throws
}

