//
//  CoreDataViewModel.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var savedTeams: [TeamEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "TeamsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
    }
    
    func fetchTeams() {
        let request = NSFetchRequest<TeamEntity>(entityName: "TeamEntity")
        
        do {
            try savedTeams = container.viewContext.fetch(request)
        } catch let error {
            print("ERROR fetching \(error)")
        }
    }
    
    func addTeam(text: String) {
        let newTeam = TeamEntity(context: container.viewContext)
        newTeam.name = text
        saveData()
    }
    
    func saveData() {
        
        do {
            try container.viewContext.save()
            fetchTeams()
        } catch let error {
            print("ERROR saving \(error)")
        }
    }
}
