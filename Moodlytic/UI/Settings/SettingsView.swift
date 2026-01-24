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

    var body: some View {
        List {

            // 👤 Profile
            Section("Profile") {
                SettingsRow(icon: "person.fill", title: "Account"){
                    
                }
                SettingsRow(icon: "bell.fill", title: "Notifications"){
                    
                }
                SettingsRow(icon: "lock.fill", title: "Privacy"){
                    
                }
            }

            // 🎨 App
            Section("App") {
                SettingsRow(icon: "moon.fill", title: "Appearance") {
                    showThemePicker = true
                }
                .sheet(isPresented: $showThemePicker) {
                    ThemePickerView()
                        .presentationDetents([.height(220)])
                        .presentationDragIndicator(.visible)
                }

                SettingsRow(icon: "globe", title: "Language"){
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
