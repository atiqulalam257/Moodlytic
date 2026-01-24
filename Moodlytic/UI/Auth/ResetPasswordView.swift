//
//  ResetPasswordView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 17/01/26.
//


import SwiftUI

struct ResetPasswordView: View {

    @State private var newPassword = ""
    @State private var confirmPassword = ""

    @State private var newPasswordError: String?
    @State private var confirmPasswordError: String?
    @State private var isSuccess = false

    var body: some View {
        VStack(spacing: 24) {

            Text("Reset Password")
                .font(AppFont.h1())

            Text("Create a new password for your account.")
                .font(AppFont.body())
                .foregroundColor(AppColors.textSecondary)
                .multilineTextAlignment(.center)

            MTextField(
                title: "New Password",
                placeholder: "Enter new password",
                text: $newPassword,
                fieldType: .secure,
                error: newPasswordError
            )

            MTextField(
                title: "Confirm Password",
                placeholder: "Re-enter password",
                text: $confirmPassword,
                fieldType: .secure,
                error: confirmPasswordError
            )

            if isSuccess {
                Text("Password reset successfully")
                    .font(AppFont.caption())
                    .foregroundColor(AppColors.success)
            }

            Button("Reset Password") {
                validate()
            }
            .buttonStyle(PrimaryButtonStyle())

            Spacer()
        }
        .padding()
        .appBackground()
    }

    private func validate() {
        newPasswordError =
            newPassword.count < 6 ? "Minimum 6 characters" : nil

        confirmPasswordError =
            newPassword != confirmPassword ? "Passwords do not match" : nil

        guard
            newPasswordError == nil,
            confirmPasswordError == nil
        else { return }

        // 🔐 Call backend / Firebase
        isSuccess = true
    }
}
