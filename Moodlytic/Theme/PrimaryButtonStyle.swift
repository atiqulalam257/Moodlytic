//
//  PrimaryButtonStyle.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppFont.button())
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                isEnabled
                ? AppColors.primary
                : AppColors.primary.opacity(0.5)
            )
            .cornerRadius(14)
            .opacity(configuration.isPressed ? 0.85 : 1)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}


