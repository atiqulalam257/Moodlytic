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
    @Published var isLoggedIn: Bool = false
}

