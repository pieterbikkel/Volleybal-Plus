//
//  FavoriteTeamsView.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import SwiftUI

struct FavoriteTeamsView: View {
    
    @StateObject var coreDataViewModel = CoreDataViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(coreDataViewModel.savedTeams) { team in
                        Text(team.name ?? "")
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
