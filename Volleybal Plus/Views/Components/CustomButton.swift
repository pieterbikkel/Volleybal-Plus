//
//  CustomButton.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import SwiftUI

struct CustomButton: View {
    
    var text: String
    
    var body: some View {
        Button {
            
        } label: {
            Text(text)
                
        }

        
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Laten we beginnen")
    }
}
