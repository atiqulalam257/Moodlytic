import SwiftUI

@main
struct AppRoot: App {

    @State private var showSplash = true
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashView()
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showSplash = false
                                }
                            }
                        }
                } else {
                    NavigationStack {
                        if appState.isLoggedIn {
                            MainTabView()
                        } else {
                            LoginView()
                        }
                    }
                    .transition(.opacity)
                }
            }
            // 🌍 LANGUAGE
            .environment(\.locale, appState.language.locale)

            // 🌗 THEME
            .preferredColorScheme(colorScheme(for: appState.theme))

            // 🔄 FORCE REBUILD
            .id(appState.language)

            // 🌱 STATE
            .environmentObject(appState)
        }
    }

    private func colorScheme(for theme: Theme) -> ColorScheme? {
        switch theme {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
