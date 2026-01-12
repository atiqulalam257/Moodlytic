//
//  CardView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 11/01/26.
//


import SwiftUI

struct CardView<Content: View>: View {

    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(AppColors.card)
            .cornerRadius(16)
            .shadow(
                color: Color.black.opacity(0.05),
                radius: 8,
                x: 0,
                y: 4
            )
    }
}
