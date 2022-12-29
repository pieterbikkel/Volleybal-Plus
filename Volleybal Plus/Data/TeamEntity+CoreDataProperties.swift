//
//  TeamEntity+CoreDataProperties.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 28/12/2022.
//
//

import Foundation
import CoreData


extension TeamEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TeamEntity> {
        return NSFetchRequest<TeamEntity>(entityName: "TeamEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var teamcode: String?
    @NSManaged public var location: String?
    @NSManaged public var poules: NSSet?
    
    public var poulesArray: [PouleEntity] {
        let set = poules as? Set<PouleEntity> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for poules
extension TeamEntity {

    @objc(addPoulesObject:)
    @NSManaged public func addToPoules(_ value: PouleEntity)

    @objc(removePoulesObject:)
    @NSManaged public func removeFromPoules(_ value: PouleEntity)

    @objc(addPoules:)
    @NSManaged public func addToPoules(_ values: NSSet)

    @objc(removePoules:)
    @NSManaged public func removeFromPoules(_ values: NSSet)

}

extension TeamEntity : Identifiable {

}
