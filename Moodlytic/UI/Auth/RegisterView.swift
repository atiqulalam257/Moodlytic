//
//  Register.swift
//  Moodlytic
//
//  Created by Atiq Alam on 17/01/26.
//


import SwiftUI

struct RegisterView: View {

    @Environment(\.dismiss) private var dismiss  // ✅ Add this
    
    // MARK: - State
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var selectedGender: Gender? = nil
    @State private var showSuccessSheet = false

    // MARK: - Errors
    @State private var nameError: String?
    @State private var emailError: String?
    @State private var passwordError: String?
    @State private var genderError: String?

    var body: some View {
        VStack(spacing: 20) {

            Text(StringHelper.register.localized)
                .font(AppFont.h1())

            // Name
            MTextField(
                title: StringHelper.name.localized,
                placeholder: StringHelper.enter_your_name.localized,
                text: $name,
                error: nameError
            )

            // Email
            MTextField(
                title: StringHelper.email.localized,
                placeholder: StringHelper.enter_your_email.localized,
                text: $email,
                fieldType: .email,
                error: emailError
            )

            // Password
            MTextField(
                title: StringHelper.password.localized,
                placeholder: StringHelper.create_password.localized,
                text: $password,
                fieldType: .secure,
                error: passwordError
            )

            // Gender Picker
            VStack(alignment: .leading, spacing: 6) {

                Text(StringHelper.gender.localized)
                    .font(AppFont.caption())
                    .foregroundColor(AppColors.textSecondary)

                Picker(StringHelper.gender.localized, selection: $selectedGender) {
                    Text(StringHelper.select_gender.localized).tag(Gender?.none)
                    ForEach(Gender.allCases) { gender in
                        Text(gender.title).tag(gender)
                    }
                }
                .pickerStyle(.menu)
                .padding()
                .background(AppColors.card)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            genderError != nil
                            ? AppColors.danger
                            : AppColors.divider,
                            lineWidth: 1
                        )
                )

                if let genderError {
                    Text(genderError)
                        .font(AppFont.caption())
                        .foregroundColor(AppColors.danger)
                }
            }

            // Register Button
            MButton(title: StringHelper.register.localized){
                validate()
            }

            Spacer()
        }
        .padding()
        .appBackground()
        .sheet(isPresented: $showSuccessSheet) {
            RegisterSuccessSheet {
                resetForm()
                showSuccessSheet = false
                dismiss()
            }
            .presentationDetents([.height(300)])
            .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Validation
    private func validate() {
        nameError = name.isEmpty ? StringHelper.name_required.localized : nil
        emailError = email.isEmpty ? StringHelper.emptyEmail.localized : nil
        passwordError = password.count < 6 ? StringHelper.weakPassword.localized : nil
        genderError = selectedGender == nil ? StringHelper.select_gender.localized : nil

        guard
            nameError == nil,
            emailError == nil,
            passwordError == nil,
            genderError == nil
        else { return }

        // ✅ Success
        showSuccessSheet = true
    }

    // MARK: - Reset
    private func resetForm() {
        name = ""
        email = ""
        password = ""
        selectedGender = nil
    }
}

