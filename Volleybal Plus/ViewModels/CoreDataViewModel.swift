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
        fetchTeams()
    }
    
    func teamIsFavorite(team teamQuery: String) -> Bool {
        let request = NSFetchRequest<TeamEntity>(entityName: "TeamEntity")
        request.predicate = NSPredicate(format: "name == %@", teamQuery)
        
        do {
            let result = try container.viewContext.fetch(request)
            return result.first != nil
        } catch let error {
            print("ERROR checking if team is favorite: \(error)")
        }
        return false
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
    
    func deleteTeam(team teamQuery: String) {
        let request = NSFetchRequest<TeamEntity>(entityName: "TeamEntity")
        request.predicate = NSPredicate(format: "name == %@", teamQuery)
        
        do {
            let result = try container.viewContext.fetch(request)
            if let found = result.first {
                container.viewContext.delete(found)
                saveData()
            }
        } catch let error {
            print("ERROR deleting team by lookup: \(error)")
        }
    }
    
    func deleteTeam(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedTeams[index]
        container.viewContext.delete(entity)
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
