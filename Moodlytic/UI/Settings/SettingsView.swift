//
//  SettingsView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//


import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var appState: AppState
    @State private var showThemePicker = false
    @State private var showLaunguagePicker = false
    @Environment(\.colorScheme) var colorScheme
    @State private var showLogoutSheet = false

    var body: some View {
        List {

            // 👤 Profile
            Section(StringHelper.profile.localized) {
                SettingsRow(icon: "person.fill", title: StringHelper.account.localized){
                    
                }
                SettingsRow(icon: "bell.fill", title: StringHelper.notifications.localized){
                    
                }
                SettingsRow(icon: "lock.fill", title: StringHelper.privacy.localized){
                    
                }
            }

            // 🎨 App
            Section(StringHelper.app.localized) {
                SettingsRow(icon: "moon.fill", title: StringHelper.appearance.localized) {
                    showThemePicker = true
                }
                .sheet(isPresented: $showThemePicker) {
                    ThemePickerView()
                        .presentationDetents([.height(220)])
                        .presentationDragIndicator(.visible)
                }

                SettingsRow(icon: "globe", title: StringHelper.language.localized){
                    showLaunguagePicker = true
                }.sheet(isPresented: $showLaunguagePicker){
                    LanguagePickerView()
                        .presentationDetents([.height(180)])
                        .presentationDragIndicator(.visible)
                }
            
            }

            // 🚪 Logout
            Section {
                Button(role: .destructive) {
                    showLogoutSheet = true
                } label: {
                    HStack {
                        Image(systemName: "arrow.backward.circle.fill")
                        Text(StringHelper.logout.localized)
                    }
                }
            }
        }
        .sheet(isPresented: $showLogoutSheet) {
            LogoutConfirmationView()
                .presentationDetents([.height(220)])
        }
        .navigationTitle(StringHelper.settings.localized)
    }
}
