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
                Text(StringHelper.home.localized)
            }

            // 📓 Journal
            NavigationStack {
                JournalListView()
            }
            .tabItem {
                Image(systemName: "book.closed.fill")
                Text(StringHelper.journal.localized)
            }

            // 🧠 Emotional
            NavigationStack {
                EmotionalInsightsView()
            }
            .tabItem {
                Image(systemName: "brain.head.profile")
                Text(StringHelper.emotional.localized)
            }

            // ⚙️ Settings
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text(StringHelper.settings.localized)
            }
        }
        .tint(AppColors.primary) // active tab color
    }
}
