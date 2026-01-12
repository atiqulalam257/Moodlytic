//
//  AIMessageBubble.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import SwiftUI

struct AIMessageBubble: View {
    let message: String

    var body: some View {
        Text(message)
            .font(AppFont.body())
            .foregroundColor(AppColors.textPrimary)
            .padding()
            .background(
                LinearGradient(
                    colors: [
                        AppColors.secondary.opacity(0.4),
                        AppColors.primary.opacity(0.3)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(18)
    }
}
