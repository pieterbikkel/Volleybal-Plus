//
//  CDPouleViewModel.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 27/12/2022.
//

import Foundation
import CoreData

class CDPouleViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var savedPoules: [PouleEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "VolleybalContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        fetchPoules()
    }
    
    func fetchPoules() {
        let request = NSFetchRequest<PouleEntity>(entityName: "PouleEntity")

        do {
            try savedPoules = container.viewContext.fetch(request)
        } catch let error {
            print("ERROR fetching \(error)")
        }
    }
    
    // TODO: Delete a poul when poule has ended
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchPoules()
        } catch let error {
            print("ERROR saving \(error)")
        }
    }
}
