//
//  SearchView.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 21/12/2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var vm = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack() {
                searchField
                
                if vm.results.isEmpty {
                    emptySection
                } else {
                    ScrollView {
                        ForEach(vm.results, id: \.naam) { item in
                            TeamSearchCell(image: item._links.logo_url.href, team: item.naam, location: item.vestigingsplaats)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Zoeken")
        }
    }
    
    var searchField: some View {
        ZStack {
            Color.theme.lightGray
            HStack {
                TextField("Zoek een team...", text: $vm.searchQuery)
                Spacer()
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 10)
                    .foregroundColor(Color.theme.gray)
             }
             .foregroundColor(Color.theme.black)
             .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
    
    var emptySection: some View {
        Section {
          Text("Geen teams gevonden")
            .foregroundColor(.gray)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
