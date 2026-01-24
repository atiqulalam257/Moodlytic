//
//  LoginUseCase.swift
//  Moodlytic
//
//  Created by Atiq Alam on 18/01/26.
//


protocol LoginUseCase {
    func execute(email: String, password: String) async throws
}
