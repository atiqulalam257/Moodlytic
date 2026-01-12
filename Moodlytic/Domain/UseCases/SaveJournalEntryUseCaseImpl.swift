//
//  SaveJournalEntryUseCaseImpl.swift
//  Moodlytic
//
//  Created by Atiq Alam on 29/12/25.
//


import Foundation

final class SaveJournalEntryUseCaseImpl: SaveJournalEntryUseCase {

    private let repository: JournalRepository

    init(repository: JournalRepository) {
        self.repository = repository
    }

    func execute(entry: JournalEntry) async throws {
        try await repository.save(entry: entry)
    }
}
