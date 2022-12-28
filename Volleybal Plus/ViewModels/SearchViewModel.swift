//
//  SearchViewModel.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 21/12/2022.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    @Published var searchQuery: String = ""
    @Published var results: [Team] = []
    @Published var isSearching = false
    
    var cancellables = Set<AnyCancellable>()
    var searchCancellables: AnyCancellable? = nil
    
    init() {
        searchTeams()
    }
    
    func searchTeams() {
        
        $searchQuery
            .debounce(for: 0.4, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .handleEvents(receiveOutput: { output in
                self.isSearching = true
            })
            .flatMap { value in
                Future { promise in
                    Task {
                        if (self.searchQuery.count > 4) {
                            do {
                                let result = try await Webservice().load(SearchResult.bySearchTeam(self.searchQuery, searchType: "team"))
                                promise(.success(result._embedded.items))
                            } catch let error {
                                print("Error searching: \(error)")
                            }
                        }
                    }
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .handleEvents(receiveOutput: { output in
                self.isSearching = false
            })
            .assign(to: &$results)
    }
    
}
