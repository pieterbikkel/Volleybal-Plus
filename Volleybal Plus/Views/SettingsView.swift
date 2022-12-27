//
//  SettingsView.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showFavoriteTeams = false
    @State private var showSearchView = false
    
    var body: some View {
        
        VStack {
            Button("Favoriete teams") {
                showFavoriteTeams = true
            }
            .buttonStyle(GradientButtonStyle())
            .popover(isPresented: $showFavoriteTeams) {
                FavoriteTeamsView()
            }
            
            Button("Team toevoegen") {
                showSearchView = true
            }
            .buttonStyle(GradientButtonStyle())
            .popover(isPresented: $showSearchView) {
                SearchView()
            }
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
