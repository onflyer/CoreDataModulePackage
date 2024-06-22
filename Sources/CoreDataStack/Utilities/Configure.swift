//
//  CoreDataStack
//  
//
//  Created by Aleksandar Milidrag on 20.06.2024.
//

import CoreData

/// Global function to configure an object with given closure.
func configure<T>(_ object: T, with configurator: (T) -> Void) -> T {
    configurator(object)
    
    return object
}
