//
//  GetAllJournalEntriesUseCaseImpl.swift
//  Moodlytic
//
//  Created by Atiq Alam on 11/01/26.
//


final class GetAllJournalEntriesUseCaseImpl: GetAllJournalEntriesUseCase {

    private let repository: JournalRepository

    init(repository: JournalRepository) {
        self.repository = repository
    }

    func execute() async throws -> [JournalEntry] {
        try await repository.fetchAll()
    }
}
