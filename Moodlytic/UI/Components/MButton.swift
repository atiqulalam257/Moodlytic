//
//  MButton.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//


import SwiftUI

struct MButton: View {

    let title: String
    var isLoading: Bool = false
    var isDisabled: Bool = false
    var action: () -> Void

    var body: some View {
        Button {
            if !isLoading && !isDisabled {
                action()
            }
        } label: {
            ZStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.white)
                } else {
                    Text(title)
                        .font(AppFont.button())
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(
                isDisabled
                ? AppColors.primary.opacity(0.5)
                : AppColors.primary
            )
            .cornerRadius(14)
        }
        .disabled(isDisabled || isLoading)
    }
}
