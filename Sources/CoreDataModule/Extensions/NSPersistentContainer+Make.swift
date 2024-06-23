//
//  CoreDataStorage
//  
//
//  Created by Aleksandar Milidrag on 20.06.2024.
//

import CoreData

public extension NSPersistentContainer {

    static func makePersistentContainer<Container: NSPersistentContainer>(
        named name: String,
        forModel model: NSManagedObjectModel,
        configurator: PersistentStoreDescriptionConfigurator
    ) throws -> Container {
        let persistentContainer = Container(name: name, managedObjectModel: model)

        let description = NSPersistentStoreDescription()
        try configurator.configure(description)
        
        persistentContainer.persistentStoreDescriptions = [
            description
        ]
        return persistentContainer
    }
    
    var isInMemory: Bool {
        persistentStoreDescriptions.contains { $0.type == NSInMemoryStoreType }
    }
    
}
