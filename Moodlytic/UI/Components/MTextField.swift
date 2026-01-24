//
//  TextField.swift
//  Moodlytic
//
//  Created by Atiq Alam on 17/01/26.
//

import SwiftUI


struct MTextField: View {

    enum FieldType {
        case text
        case secure
        case email
        case number
    }

    let title: String
    let placeholder: String
    @Binding var text: String
    var fieldType: FieldType = .text
    var error: String? = nil

    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            // Title
            Text(title)
                .font(AppFont.caption())
                .foregroundColor(AppColors.textSecondary)

            // Field
            fieldView
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .background(AppColors.card)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(borderColor, lineWidth: 1)
                )
                .focused($isFocused)

            // Error
            if let error {
                Text(error)
                    .font(AppFont.caption())
                    .foregroundColor(AppColors.danger)
            }
        }
    }

    // MARK: - Field Switch
    @ViewBuilder
    private var fieldView: some View {
        switch fieldType {
        case .secure:
            SecureField(placeholder, text: $text)
                .textContentType(.password)

        case .email:
            TextField(placeholder, text: $text)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .textContentType(.emailAddress)

        case .number:
            TextField(placeholder, text: $text)
                .keyboardType(.numberPad)

        default:
            TextField(placeholder, text: $text)
        }
    }

    // MARK: - Border Color
    private var borderColor: Color {
        if error != nil {
            return AppColors.danger
        }
        return isFocused ? AppColors.primary : AppColors.divider
    }
}

