//
//  MoodProgressRow.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//

import SwiftUI


struct MoodProgressRow: View {

    let title: String
    let value: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(title)
                Spacer()
                Text("\(Int(value * 100))%")
                    .foregroundColor(AppColors.textSecondary)
            }
            ProgressView(value: value)
                .tint(AppColors.primary)
        }
    }
}
