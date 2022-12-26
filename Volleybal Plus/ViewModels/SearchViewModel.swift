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
    var cancellables = Set<AnyCancellable>()
    var searchCancellables: AnyCancellable? = nil
    
    init() {
        searchTeams()
    }
    
    func searchTeams() {
        
        searchCancellables = $searchQuery
            .removeDuplicates()
            .debounce(for: 0.4, scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] str in
                if str == "" {
                    // reset data
                    self?.results = []
                } else {
                    // search data with searchQuery
                    self?.getResults()
                }
            })
    }
    
    private func getResults() {
        
        let originalQuery = searchQuery.replacingOccurrences(of: " ", with: "%20")
        
        guard let url = URL(string: "https://api.nevobo.nl/v1/zoeken?include=team&q=\(originalQuery)") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .sink { completion in
                print("COMPLETION: \(completion)")
            } receiveValue: { [weak self] returnedResults in
                self?.results = returnedResults._embedded.items
            }
            .store(in: &cancellables)
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
