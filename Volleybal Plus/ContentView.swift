//
//  ContentView.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 21/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var baseData = BaseViewModel()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .environmentObject(baseData)
                

            CompetitionView()
                .tabItem {
                    Label("Competitie", systemImage: "calendar")
                }
            
            SettingsView()
                .tabItem {
                    Label("Instellingen", systemImage: "gear")
                }
            
        }.accentColor(Color.theme.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
