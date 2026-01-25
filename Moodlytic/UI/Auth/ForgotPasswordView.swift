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

            Text(StringHelper.forgot_password_title.localized)
                .font(AppFont.h1())

            Text(StringHelper.forgot_password_subtitle.localized)
                .font(AppFont.body())
                .foregroundColor(AppColors.textSecondary)
                .multilineTextAlignment(.center)

            MTextField(
                title: StringHelper.email.localized,
                placeholder: StringHelper.enter_your_name.localized,
                text: $email,
                fieldType: .email,
                error: emailError
            )

            if isSuccess {
                Text(StringHelper.reset_link_sent.localized)
                    .font(AppFont.caption())
                    .foregroundColor(AppColors.success)
            }

            Button(StringHelper.send_reset_link.localized) {
                validate()
            }
            .buttonStyle(PrimaryButtonStyle())

            Spacer()
        }
        .padding()
        .appBackground()
    }

    private func validate() {
        emailError = email.isEmpty ? StringHelper.emptyEmail.localized : nil

        guard emailError == nil else { return }

        // 🔗 Call API / Firebase later
        isSuccess = true
    }
}
