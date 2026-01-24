//
//  ThemePickerView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//
import SwiftUI

struct ThemePickerView: View {

    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss  // ✅ Add this

    var body: some View {
        List {
            ForEach(Theme.allCases, id: \.self) { theme in
                HStack {
                    Text(title(for: theme))
                    Spacer()
                    if appState.theme == theme {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    appState.theme = theme
                    dismiss()
                }
            }
        }
        //.navigationTitle("Appearance")
    }

    private func title(for theme: Theme) -> String {
        switch theme {
        case .system: return "System"
        case .light: return "Light"
        case .dark: return "Dark"
        }
    }
}
