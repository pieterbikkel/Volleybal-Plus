//
//  TeamSearchCell.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import SwiftUI

struct TeamSearchCell: View {
    
    @State private var favorite = false
    @StateObject var coreDataViewModel = CDTeamViewModel()
    
    var image: String
    var team: String
    var location: String
    var teamcode: String
    
    var body: some View {
        HStack(spacing: 20) {
            DownloadingImageView(url: image, key: teamcode)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .cornerRadius(20)
                .background(Color.white)
            
            VStack(alignment: .leading) {
                Text(team)
                    .font(.headline)
                Text(location)
            }
            
            Spacer()
            
            Button {
                // add or remove team as favorite
                if(coreDataViewModel.teamIsFavorite(team: team)) {
                    coreDataViewModel.deleteTeam(team: team)
                } else {
                    Task {
                        await coreDataViewModel.addTeam(name: team, teamcode: teamcode, location: location)
                    }
                    
                }
                
            } label: {
                Image(systemName: coreDataViewModel.teamIsFavorite(team: team) ? "heart.fill" : "heart")
                    .foregroundColor(Color.theme.orange)
                    .font(.system(size: 26))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
    }
}

struct TeamSearchCell_Previews: PreviewProvider {
    static var previews: some View {
        TeamSearchCell(image: "photo", team: "Morgana DVO HS 1", location: "Hengelo GLD", teamcode: "ckl8c6m-hs-1")
    }
}
