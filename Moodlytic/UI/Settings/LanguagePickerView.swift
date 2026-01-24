//
//  LanguagePickerView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//
import SwiftUI

struct LanguagePickerView: View {

    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss  // ✅ Add this

    var body: some View {
        List {
            ForEach(AppLanguage.allCases, id: \.self) { lang in
                HStack {
                    Text(title(for: lang))
                    Spacer()
                    if appState.language == lang {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    appState.language = lang
                    dismiss()
                }
            }
        }
       // .navigationTitle("Language")
    }

    private func title(for lang: AppLanguage) -> String {
        switch lang {
        case .english: return "English"
        case .arabic:  return "العربية"
        }
    }
}
