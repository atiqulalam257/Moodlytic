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

            Text(StringHelper.reset_password_subtitle)
                .font(AppFont.h1())

            Text(StringHelper.create_password.localized)
                .font(AppFont.body())
                .foregroundColor(AppColors.textSecondary)
                .multilineTextAlignment(.center)

            MTextField(
                title: StringHelper.new_password.localized,
                placeholder: StringHelper.enter_new_password.localized,
                text: $newPassword,
                fieldType: .secure,
                error: newPasswordError
            )

            MTextField(
                title: StringHelper.confirm_password.localized,
                placeholder: StringHelper.reenter_password.localized,
                text: $confirmPassword,
                fieldType: .secure,
                error: confirmPasswordError
            )

            if isSuccess {
                Text(StringHelper.password_reset_success.localized)
                    .font(AppFont.caption())
                    .foregroundColor(AppColors.success)
            }

            Button(StringHelper.reset_password.localized) {
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
        newPassword.count < 6 ? StringHelper.weakPassword.localized : nil

        confirmPasswordError =
        newPassword != confirmPassword ? StringHelper.passwords_do_not_match.localized : nil

        guard
            newPasswordError == nil,
            confirmPasswordError == nil
        else { return }

        // 🔐 Call backend / Firebase
        isSuccess = true
    }
}
