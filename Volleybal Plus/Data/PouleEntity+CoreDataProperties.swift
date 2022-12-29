//
//  PouleEntity+CoreDataProperties.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 28/12/2022.
//
//

import Foundation
import CoreData


extension PouleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PouleEntity> {
        return NSFetchRequest<PouleEntity>(entityName: "PouleEntity")
    }

    @NSManaged public var poulecode: String?
    @NSManaged public var teamcode: String?
    @NSManaged public var poule: String?
    @NSManaged public var team: TeamEntity?
    
    public var wrappedName: String {
        poule ?? "Unknown poule"
    }

}

extension PouleEntity : Identifiable {

}
