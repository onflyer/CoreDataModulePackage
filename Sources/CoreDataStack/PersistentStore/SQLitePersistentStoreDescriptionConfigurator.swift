//
//  CoreDataStorage
//  
//
//  Created by Aleksandar Milidrag on 20.06.2024.
//

import CoreData

public struct SQLitePersistentStoreDescriptionConfigurator: PersistentStoreDescriptionConfigurator {
    
    // MARK: - Properties

    private let fileURL: URL
    private let shouldMigrateStoreAutomatically: Bool
    private let shouldInferMappingModelAutomatically: Bool
    
    // MARK: - Initialization

    init(
        directory: URL = NSPersistentContainer.defaultDirectoryURL(),
        name: String,
        shouldMigrateStoreAutomatically: Bool = true,
        shouldInferMappingModelAutomatically: Bool = true
    ) {
        let fileURL = directory
            .appendingPathComponent(name, isDirectory: true)
            .appendingPathComponent(name) // this is the file name
            .appendingPathExtension("sqlite")
        self.init(
            fileURL: fileURL,
            shouldMigrateStoreAutomatically: shouldMigrateStoreAutomatically,
            shouldInferMappingModelAutomatically: shouldInferMappingModelAutomatically
        )
    }

    init(
        fileURL: URL,
         shouldMigrateStoreAutomatically: Bool = true,
         shouldInferMappingModelAutomatically: Bool = true
    ) {
        self.fileURL = fileURL
        self.shouldMigrateStoreAutomatically = shouldMigrateStoreAutomatically
        self.shouldInferMappingModelAutomatically = shouldInferMappingModelAutomatically
    }
    
    // MARK: - Methods

    public func configure(_ description: NSPersistentStoreDescription) throws {
        description.type = NSSQLiteStoreType

        description.shouldInferMappingModelAutomatically = shouldInferMappingModelAutomatically
        description.shouldMigrateStoreAutomatically = shouldMigrateStoreAutomatically

        // Create the intermediate directories, if missing.
        let directory = fileURL.deletingLastPathComponent()
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
        description.url = fileURL
    }
    
}
