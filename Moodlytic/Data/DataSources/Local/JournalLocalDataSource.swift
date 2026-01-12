//
//  JournalLocalDataSource.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import Foundation

protocol JournalLocalDataSource {
    func save(_ entry: JournalEntry) throws
    func fetchAll() throws -> [JournalEntry]
}
