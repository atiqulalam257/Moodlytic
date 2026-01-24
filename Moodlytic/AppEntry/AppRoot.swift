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
                    }.transition(.opacity)
                    
                }
            }
            .preferredColorScheme(colorScheme(for: appState.theme))
            .environmentObject(appState)
            .id(appState.language)
        }
    }
    
    private func colorScheme(for theme: Theme) -> ColorScheme? {
            switch theme {
            case .system:
                return nil          // follow system
            case .light:
                return .light
            case .dark:
                return .dark
            }
        }
    
}
