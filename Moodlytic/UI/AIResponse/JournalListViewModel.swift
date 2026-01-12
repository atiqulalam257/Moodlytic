//
//  JournalListViewModel.swift
//  Moodlytic
//
//  Created by Atiq Alam on 11/01/26.
//
import Foundation
import SwiftUI
import Combine

@MainActor
final class JournalListViewModel: ObservableObject {

    @Published var entries: [JournalEntry] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let getAllUseCase: GetAllJournalEntriesUseCase

    init(
        getAllUseCase: GetAllJournalEntriesUseCase =
            AppContainer.shared.getAllJournalEntriesUseCase
    ) {
        self.getAllUseCase = getAllUseCase
    }

    func load() async {
        isLoading = true
        errorMessage = nil

        do {
            entries = try await getAllUseCase.execute()
                .sorted { $0.date > $1.date }
        } catch {
            errorMessage = "Failed to load journal history"
        }

        isLoading = false
    }
}
