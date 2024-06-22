//
//  CoreDataStack
//  
//
//  Created by Aleksandar Milidrag on 20.06.2024.
//

import CoreData

extension CoreDataService {
    
    static let viewContextDefaultConfigurator: (NSManagedObjectContext) -> Void = { context in
        context.automaticallyMergesChangesFromParent = true
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
    
    static let readContextDefaultConfigurator: (NSManagedObjectContext) -> Void = { context in
        context.automaticallyMergesChangesFromParent = true
        context.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }
    
    static let writeContextDefaultConfigurator: (NSManagedObjectContext) -> Void = { context in
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
    
}
