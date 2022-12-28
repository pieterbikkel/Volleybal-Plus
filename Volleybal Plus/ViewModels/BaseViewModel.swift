//
//  BaseViewModel.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 27/12/2022.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    
    // Tab Bar...
    @Published var currentTab: Tab = .Home
    
    @Published var homeTab = "Uitslagen"
    
    // Detail View Properties...
    @Published var showDetail = false
}

// Enum Case for Tab Items...
enum Tab: String{
    case Home = "home"
    case Heart = "heart"
    case ClipBoard = "clipboard"
    case Person = "person"
}

