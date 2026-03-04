//
//  AppState.swift
//  Moodlytic
//
//  Created by Atiq Alam on 21/01/26.
//


import SwiftUI
import Combine

@MainActor
final class AppState: ObservableObject {

    @Published var language: AppLanguage {
        didSet {
            UserDefaults.standard.set(language.rawValue, forKey: "AppleLanguages")
        }
    }

    @Published var theme: Theme {
        didSet {
            UserDefaults.standard.set(theme.rawValue, forKey: "app_theme")
        }
    }

    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }

    init() {
        let savedTheme = UserDefaults.standard.string(forKey: "app_theme")
        self.theme = Theme(rawValue: savedTheme ?? "") ?? .system

        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")

        let savedLang = UserDefaults.standard.string(forKey: "AppleLanguages")
        self.language = AppLanguage(rawValue: savedLang ?? "") ?? .english
    }
}


