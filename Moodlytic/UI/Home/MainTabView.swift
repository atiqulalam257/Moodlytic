//
//  MainTabView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//


import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {

            // 🏠 Home
            NavigationStack {
                HomeView(viewModel: HomeViewModel())
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            // 📓 Journal
            NavigationStack {
                JournalListView()
            }
            .tabItem {
                Image(systemName: "book.closed.fill")
                Text("Journal")
            }

            // 🧠 Emotional
            NavigationStack {
                EmotionalInsightsView()
            }
            .tabItem {
                Image(systemName: "brain.head.profile")
                Text("Emotional")
            }

            // ⚙️ Settings
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
        .tint(AppColors.primary) // active tab color
    }
}
