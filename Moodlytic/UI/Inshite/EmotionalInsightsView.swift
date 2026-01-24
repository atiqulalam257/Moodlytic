//
//  EmotionalInsightsView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//


import SwiftUI

struct EmotionalInsightsView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                Text("Emotional Insights")
                    .font(AppFont.h1())
                    .frame(maxWidth: .infinity, alignment: .leading)

                // 🌈 Weekly Mood Summary
                CardView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("This Week")
                            .font(AppFont.caption())
                            .foregroundColor(AppColors.textSecondary)

                        Text("Mostly Calm 🙂")
                            .font(AppFont.h2())

                        Text("You felt calm and positive most days this week. Keep maintaining your routines.")
                            .font(AppFont.body())
                            .foregroundColor(AppColors.textSecondary)
                    }
                }

                // 📊 Mood Distribution (placeholder)
                CardView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Mood Distribution")
                            .font(AppFont.h3())

                        VStack(spacing: 8) {
                            MoodProgressRow(title: "Happy", value: 0.5)
                            MoodProgressRow(title: "Calm", value: 0.7)
                            MoodProgressRow(title: "Anxious", value: 0.2)
                            MoodProgressRow(title: "Sad", value: 0.1)
                        }
                    }
                }

                // 💡 Insight Tip
                CardView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Insight")
                            .font(AppFont.h3())

                        Text("Writing your thoughts on anxious days reduced stress by 30%.")
                            .font(AppFont.body())
                    }
                }
            }
            .padding()
        }
        .appBackground()
    }
}
