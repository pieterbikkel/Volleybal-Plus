//
//  CompetitionView.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import SwiftUI

struct CompetitionView: View {
    
    @StateObject var vm = CDTeamViewModel()
    
    var body: some View {
//        Text("Competitie")
        List {
            ForEach(vm.savedTeams) { team in
                Section(team.poules as? Set<Poules> ?? []) {
                    
                }
            }
        }
    }
}

struct CompetitionView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionView()
    }
}
