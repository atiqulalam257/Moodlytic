//
//  MoodSelector.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import SwiftUI

import SwiftUI

struct MoodSelector: View {

    @Binding var selectedMood: Mood

    private let moods: [Mood] = Mood.allCases

    var body: some View {
        HStack(spacing: 16) {
            ForEach(moods, id: \.self) { mood in
                Text(mood.emoji)
                    .font(.system(size: 32))
                    .padding(10)
                    .background(
                        selectedMood == mood
                        ? AppColors.secondary.opacity(0.3)
                        : Color.clear
                    )
                    .cornerRadius(12)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedMood = mood
                        }
                    }
            }
        }
    }
}

