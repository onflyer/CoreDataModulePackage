//
//  CoreDataStorage
//  
//
//  Created by Aleksandar Milidrag on 20.06.2024.
//

import CoreData

public protocol PersistentStoreDescriptionConfigurator {

    func configure(_ description: NSPersistentStoreDescription) throws
    
}
