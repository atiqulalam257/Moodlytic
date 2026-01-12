//
//  JournalRow.swift
//  Moodlytic
//
//  Created by Atiq Alam on 11/01/26.
//

import SwiftUI

struct JournalRow: View {

    let entry: JournalEntry

    var body: some View {
        CardView {
            VStack(alignment: .leading, spacing: 10) {

                HStack {
                    Text(entry.mood.emoji)
                        .font(.system(size: 28))

                    Spacer()

                    Text(entry.date.formatted(
                        date: .abbreviated,
                        time: .omitted
                    ))
                    .font(AppFont.caption())
                    .foregroundColor(AppColors.textSecondary)
                }

                Text(entry.text)
                    .font(AppFont.body())
                    .lineLimit(3)

                if let ai = entry.aiResponse {
                    Text("AI: \(ai)")
                        .font(AppFont.caption())
                        .foregroundColor(AppColors.textSecondary)
                }
            }
        }
    }
}
