//
//  SettingsView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//


import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {
        List {

            // 👤 Profile
            Section("Profile") {
                SettingsRow(icon: "person.fill", title: "Account")
                SettingsRow(icon: "bell.fill", title: "Notifications")
                SettingsRow(icon: "lock.fill", title: "Privacy")
            }

            // 🎨 App
            Section("App") {
                SettingsRow(icon: "moon.fill", title: "Dark Mode")
                SettingsRow(icon: "globe", title: "Language")
            }

            // 🚪 Logout
            Section {
                Button(role: .destructive) {
                    appState.isLoggedIn = false
                } label: {
                    HStack {
                        Image(systemName: "arrow.backward.circle.fill")
                        Text("Logout")
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}
