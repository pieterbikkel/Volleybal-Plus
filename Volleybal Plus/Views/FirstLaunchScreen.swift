//
//  FirstLaunchScreen.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import SwiftUI

struct FirstLaunchscreen: View {
    var body: some View {
        VStack {
            Text("Welkom bij")
                .font(.system(size: 34, weight: .bold))
            
            Image("volleybal-plus-logo")
                .padding(.vertical, 30)
            
            Button("Laten we beginnen") {
                
            }.buttonStyle(GradientButtonStyle())
        }
    }
}

struct FirstLaunchscreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstLaunchscreen()
    }
}
