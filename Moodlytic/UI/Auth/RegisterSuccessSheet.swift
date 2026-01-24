//
//  RegisterSuccessSheet.swift
//  Moodlytic
//
//  Created by Atiq Alam on 21/01/26.
//


import SwiftUI

struct RegisterSuccessSheet: View {

    let onContinue: () -> Void

    var body: some View {
        VStack(spacing: 20) {

            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 64))
                .foregroundColor(AppColors.success)

            Text("Registration Successful 🎉")
                .font(AppFont.h2())
                .multilineTextAlignment(.center)

            Text("Your account has been created successfully.")
                .font(AppFont.body())
                .foregroundColor(AppColors.textSecondary)
                .multilineTextAlignment(.center)

            Button("Continue to Login") {
                onContinue()
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.top, 10)
        }
        .padding()
    }
}
