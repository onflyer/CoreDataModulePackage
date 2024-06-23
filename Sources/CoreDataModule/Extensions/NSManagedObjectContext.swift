//
//  NSManagedObjectContext.swift
//
//
//  Created by Aleksandar Milidrag on 22.6.2024.
//

import CoreData
import Foundation

@available(macOS 12.0, iOS 15.0.0, *)
 public extension NSManagedObjectContext {
    func fetchAndMapToDomain<E, R>(request: NSFetchRequest<E>) async throws -> [R] where E: NSManagedObject, E: DomainMappable, R == E.DomainType {
        try await self.perform { [weak self] in
            try self?.fetch(request).compactMap { try $0.toDomainObject() } ?? []
        }
    }
}

public enum MapError: Error {
    case invalidMapping
}

public protocol DomainMappable {
    associatedtype DomainType
    func toDomainObject() throws -> DomainType
}
