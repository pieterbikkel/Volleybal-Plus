//
//  PouleResult.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 27/12/2022.
//

import Foundation

struct PouleResult: Codable {
    let _embedded: PouleItems
}

struct PouleItems: Codable {
    let items: [Poule]
}

struct Poule: Codable {
    let promotie_hoogste: Int?
    let promotie_laagste: Int?
    let promotiewedstrijden_hoogste: Int?
    let promotiewedstrijden_laagste: Int?
    let handhaving_hoogste: Int?
    let handhaving_laagste: Int?
    let is_stand_berekenbaar: Bool
    let code: String
    let omschrijving: String
    let _embedded: EmbeddedRegio
}

struct EmbeddedRegio: Codable {
    let regio: Regio
}

struct Regio: Codable {
    let code: String
    let omschrijving: String
}
