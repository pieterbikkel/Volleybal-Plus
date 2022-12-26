//
//  GradientButtonStyle.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(Color.theme.white)
            .font(.headline)
            .background(LinearGradient(colors: [Color.theme.yellow, Color.theme.orange], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(16)
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}
