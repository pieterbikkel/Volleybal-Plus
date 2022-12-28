//
//  CDTeamViewModel.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import Foundation
import CoreData

class CDTeamViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var savedTeams: [TeamEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "VolleybalContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
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
        let teamRequest = NSFetchRequest<TeamEntity>(entityName: "TeamEntity")

        DispatchQueue.main.async {
            do {
                try self.savedTeams = self.container.viewContext.fetch(teamRequest)
            } catch let error {
                print("ERROR fetching \(error)")
            }
        }
    }
    
    func addTeam(name: String, teamcode: String, location: String) async {
        do {
            let poules = try await Webservice().load(PouleResult.byTeam(teamcode))
            
            for poule in poules._embedded.items {
                let newPoule = PouleEntity(context: container.viewContext)
                newPoule.poule = poule.omschrijving
                newPoule.poulecode = poule.code
                newPoule.team = TeamEntity(context: container.viewContext)
                newPoule.team?.name = name
                newPoule.team?.teamcode = teamcode
                newPoule.team?.location = location
            }
            saveData()
        } catch let error {
            print("ERROR saving team with poules to core data: \(error)")
        }
    }
    
    func deleteTeam(team teamQuery: String) {
        
        // TODO: Delete poule when team gets deleted
        
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
        
        // TODO: Delete poule when team gets deleted
        
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
