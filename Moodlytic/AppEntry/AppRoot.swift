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
            .environmentObject(appState) // 🔥 INJECT HERE
        }
    }
}
