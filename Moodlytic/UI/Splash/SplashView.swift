//
//  SplashView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import SwiftUI

struct SplashView: View {

    @State private var scale = 0.8

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [AppColors.primary, AppColors.secondary, .green],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "brain.head.profile")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .scaleEffect(scale)

                Text(StringHelper.mind_journal.localized)
                    .font(AppFont.h1())
                    .foregroundColor(.white)

                Text(StringHelper.safe_space_thoughts.localized)
                    .font(AppFont.body())
                    .foregroundColor(.white.opacity(0.85))
            }
            .onAppear {
                withAnimation(.easeOut(duration: 1)) {
                    scale = 1
                }
            }
        }
    }
}
#Preview {
    SplashView()
}

