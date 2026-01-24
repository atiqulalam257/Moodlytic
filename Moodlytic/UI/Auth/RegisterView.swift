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

            Text("Register")
                .font(AppFont.h1())

            // Name
            MTextField(
                title: "Name",
                placeholder: "Enter your name",
                text: $name,
                error: nameError
            )

            // Email
            MTextField(
                title: "Email",
                placeholder: "Enter your email",
                text: $email,
                fieldType: .email,
                error: emailError
            )

            // Password
            MTextField(
                title: "Password",
                placeholder: "Create a password",
                text: $password,
                fieldType: .secure,
                error: passwordError
            )

            // Gender Picker
            VStack(alignment: .leading, spacing: 6) {

                Text("Gender")
                    .font(AppFont.caption())
                    .foregroundColor(AppColors.textSecondary)

                Picker("Gender", selection: $selectedGender) {
                    Text("Select gender").tag(Gender?.none)
                    ForEach(Gender.allCases) { gender in
                        Text(gender.rawValue)
                            .tag(Gender?.some(gender))
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
            MButton(title: "Register"){
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
        nameError = name.isEmpty ? "Name is required" : nil
        emailError = email.isEmpty ? "Email is required" : nil
        passwordError = password.count < 6 ? "Minimum 6 characters" : nil
        genderError = selectedGender == nil ? "Please select gender" : nil

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

