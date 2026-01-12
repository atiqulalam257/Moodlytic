//
//  AppRoot.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import SwiftUI

@main
struct AppRoot: App {

    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashView()
                        .transition(.opacity)
                        .onAppear {
                            // Splash duration: 2 seconds
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showSplash = false
                                }
                            }
                        }
                } else {
                    NavigationStack {
                        HomeView(viewModel: HomeViewModel())
                    }
                    .transition(.opacity)
                }
            }
        }
    }
}
