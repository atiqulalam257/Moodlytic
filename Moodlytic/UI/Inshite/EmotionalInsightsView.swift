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

                Text(StringHelper.emotional_insights.localized)
                    .font(AppFont.h1())
                    .frame(maxWidth: .infinity, alignment: .leading)

                // 🌈 Weekly Mood Summary
                CardView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(StringHelper.this_week.localized)
                            .font(AppFont.caption())
                            .foregroundColor(AppColors.textSecondary)

                        Text(StringHelper.mostly_calm.localized)
                            .font(AppFont.h2())

                        Text(StringHelper.weekly_summary.localized)
                            .font(AppFont.body())
                            .foregroundColor(AppColors.textSecondary)
                    }
                }

                // 📊 Mood Distribution (placeholder)
                CardView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(StringHelper.mood_distribution.localized)
                            .font(AppFont.h3())

                        VStack(spacing: 8) {
                            MoodProgressRow(title: StringHelper.mood_happy.localized, value: 0.5)
                            MoodProgressRow(title: StringHelper.mood_calm.localized, value: 0.7)
                            MoodProgressRow(title: StringHelper.mood_anxious.localized, value: 0.2)
                            MoodProgressRow(title: StringHelper.mood_sad.localized, value: 0.1)
                        }
                    }
                }

                // 💡 Insight Tip
                CardView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(StringHelper.insight.localized)
                            .font(AppFont.h3())

                        Text(StringHelper.insight_anxious_reduction.localized)
                            .font(AppFont.body())
                    }
                }
            }
            .padding()
        }
        .appBackground()
    }
}
