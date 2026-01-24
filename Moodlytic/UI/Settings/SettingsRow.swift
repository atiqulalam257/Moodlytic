//
//  SettingsRow.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//
import SwiftUI

struct SettingsRow: View {

    let icon: String
    let title: String
    var action: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(AppColors.primary)
                .frame(width: 24)

            Text(title)
            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(AppColors.textSecondary)
        }
        .contentShape(Rectangle())   // IMPORTANT!
        .onTapGesture {
            action()
        }
    }
}

