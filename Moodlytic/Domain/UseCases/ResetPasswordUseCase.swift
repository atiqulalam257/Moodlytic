//
//  ResetPasswordUseCase.swift
//  Moodlytic
//
//  Created by Atiq Alam on 18/01/26.
//


protocol ResetPasswordUseCase {
    func execute(email: String) async throws
}