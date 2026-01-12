//
//  GetJournalEntryUseCase.swift
//  Moodlytic
//
//  Created by Atiq Alam on 11/01/26.
//

protocol GetAllJournalEntriesUseCase {
    func execute() async throws -> [JournalEntry]
}
