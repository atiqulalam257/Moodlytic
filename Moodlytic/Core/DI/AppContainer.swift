//
//  AppContainer.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


final class AppContainer {

    static let shared = AppContainer()

    // Data layer
    lazy var journalLocalDataSource: JournalLocalDataSource = {
        JournalLocalDataSourceImpl()
    }()

    lazy var aiService: AIService = {
        AIServiceImpl()
    }()

    // Repository
    lazy var journalRepository: JournalRepository = {
        JournalRepositoryImpl(
            localDataSource: journalLocalDataSource,
            aiService: aiService
        )
    }()

    // Use Cases
    lazy var saveJournalUseCase: SaveJournalEntryUseCase = {
        SaveJournalEntryUseCaseImpl(repository: journalRepository)
    }()

    lazy var generateAIUseCase: GenerateAIResponseUseCase = {
        GenerateAIResponseUseCaseImpl(repository: journalRepository)
    }()
    
    lazy var getAllJournalEntriesUseCase: GetAllJournalEntriesUseCase = {
        GetAllJournalEntriesUseCaseImpl(repository: journalRepository)
    }()

}

