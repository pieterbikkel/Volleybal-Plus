//
//  HomeView.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var baseData: BaseViewModel
    @Namespace var animation
    
    var body: some View {
        HStack(spacing: 18){
            
            // SegmentButton...
            SegmentButton(title: "Uitslagen")
            
            SegmentButton(title: "Programma")
        }
        .padding(.vertical)
    }
    
    @ViewBuilder
    func SegmentButton(title: String) -> some View {
        Button {
            withAnimation{ baseData.homeTab = title }
        } label: {
            HStack(spacing: 8){
                
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(baseData.homeTab == title ? Color.theme.orange : Color.theme.black)
            }
            .padding(.vertical,8)
            .padding(.horizontal,12)
            .background(
                ZStack{
                    // Transition Slider...
                    if baseData.homeTab == title {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.theme.lightGray)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                    }
                }
            )
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
