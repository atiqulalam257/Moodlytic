//
//  ForgotPasswordView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 17/01/26.
//


import SwiftUI

struct ForgotPasswordView: View {

    @State private var email = ""
    @State private var emailError: String?
    @State private var isSuccess = false

    var body: some View {
        VStack(spacing: 24) {

            Text("Forgot Password")
                .font(AppFont.h1())

            Text("Enter your email to receive a password reset link.")
                .font(AppFont.body())
                .foregroundColor(AppColors.textSecondary)
                .multilineTextAlignment(.center)

            MTextField(
                title: "Email",
                placeholder: "Enter your email",
                text: $email,
                fieldType: .email,
                error: emailError
            )

            if isSuccess {
                Text("Reset link sent to your email")
                    .font(AppFont.caption())
                    .foregroundColor(AppColors.success)
            }

            Button("Send Reset Link") {
                validate()
            }
            .buttonStyle(PrimaryButtonStyle())

            Spacer()
        }
        .padding()
        .appBackground()
    }

    private func validate() {
        emailError = email.isEmpty ? "Email is required" : nil

        guard emailError == nil else { return }

        // 🔗 Call API / Firebase later
        isSuccess = true
    }
}
