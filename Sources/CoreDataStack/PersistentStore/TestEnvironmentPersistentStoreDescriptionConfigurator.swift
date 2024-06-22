//
//  CoreDataStorage
//  
//
//  Created by Aleksandar Milidrag on 20.06.2024.
//

import Foundation
import CoreData

/// Configure in-memory `NSPersistentStoreDescription` which is appropriate to use it in tests.
public struct TestEnvironmentPersistentStoreDescriptionConfigurator: PersistentStoreDescriptionConfigurator {
    
    // MARK: - Methods
    
    public func configure(_ description: NSPersistentStoreDescription) throws {
        description.type = NSInMemoryStoreType
        description.url = URL(fileURLWithPath: "/dev/null")
    }
    
}
