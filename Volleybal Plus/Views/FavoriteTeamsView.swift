//
//  FavoriteTeamsView.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import SwiftUI

struct FavoriteTeamsView: View {
    
    @StateObject var coreDataViewModel = CDTeamViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(coreDataViewModel.savedTeams) { team in
                        VStack(alignment: .leading) {
                            Text(team.name ?? "No team found")
                                .font(.headline)
                            Text(team.location ?? "No location found")
                                .foregroundColor(Color.theme.gray)
                        }
                    }.onDelete(perform: coreDataViewModel.deleteTeam)
                }
                .toolbar {
                    EditButton()
                        .foregroundColor(Color.theme.orange)
                }
                .navigationTitle("Favoriete teams")
                
                Button("Terug") {
                    
                }.buttonStyle(GradientButtonStyle())
            }
        }
        
    }
}

struct FavoriteTeamsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteTeamsView()
    }
}
