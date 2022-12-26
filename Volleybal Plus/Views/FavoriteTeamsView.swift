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
        List {
            ForEach(coreDataViewModel.savedTeams) { team in
                Text(team.name ?? "")
            }
        }
    }
}

struct FavoriteTeamsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteTeamsView()
    }
}
