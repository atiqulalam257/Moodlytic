//
//  JournalLocalDataSourceImpl.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import Foundation

final class JournalLocalDataSourceImpl: JournalLocalDataSource {

    private let fileName = "journal_entries.json"

    private var fileURL: URL {
        let directory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first!
        return directory.appendingPathComponent(fileName)
    }

    func save(_ entry: JournalEntry) throws {
        var entries = try fetchAll()
        entries.append(entry)

        let dtos = entries.map { $0.toDTO() }
        let data = try JSONEncoder().encode(dtos)
        try data.write(to: fileURL, options: .atomic)
    }

    func fetchAll() throws -> [JournalEntry] {
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            return []
        }

        let data = try Data(contentsOf: fileURL)
        let dtos = try JSONDecoder().decode([JournalEntryDTO].self, from: data)
        return dtos.map { $0.toDomain() }
    }
}
