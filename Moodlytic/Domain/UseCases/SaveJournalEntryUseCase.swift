//
//  SaveJournalEntryUseCase.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


protocol SaveJournalEntryUseCase {
    func execute(entry: JournalEntry) async throws
}
