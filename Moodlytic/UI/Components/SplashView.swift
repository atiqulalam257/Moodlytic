//
//  SplashView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import SwiftUI

struct SplashView: View {

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [AppColors.primary, AppColors.secondary,.green],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "brain.head.profile")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                Text("Mind Journal")
                    .font(AppFont.h1())
                    .foregroundColor(.white)
                Text("A safe space for your thoughts")
                    .font(AppFont.body())
                    .foregroundColor(.white.opacity(0.85))
            }
        }
    }
}
