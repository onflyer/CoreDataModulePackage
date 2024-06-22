//
//  CoreDataStorage
//  
//
//  Created by Aleksandar Milidrag on 20.06.2024.
//

import CoreData

public enum NSManagedObjectInstantiatingError: Error {
    case creationError
    case noModels
}

public extension NSManagedObjectModel {
    
    static func make(name: String, bundle: Bundle) throws -> NSManagedObjectModel {
        guard let url = bundle.url(forResource: name, withExtension: "momd") else {
            throw NSManagedObjectInstantiatingError.noModels
        }
        guard let model = NSManagedObjectModel(contentsOf: url) else {
            throw NSManagedObjectInstantiatingError.creationError
        }

        return model
    }
    
}
