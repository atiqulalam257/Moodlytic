//
//  RegisterUseCase.swift
//  Moodlytic
//
//  Created by Atiq Alam on 18/01/26.
//


protocol RegisterUseCase {
    func execute(email: String, password: String, gender: Gender) async throws
}