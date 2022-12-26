//
//  SearchResult.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 21/12/2022.
//

import Foundation

struct SearchResult: Codable {
    let count: Int
    let total: Int
    let page: Int
    let pages: Int
    let _embedded: EmbeddedSearchResult
}

struct EmbeddedSearchResult: Codable {
    let items: [Team]
}

struct Team: Codable {
    let type: String
    let seizoen: String
    let code: String
    let naam: String
    let vestigingsplaats: String
    let _links: LinksResult
    
}

struct LinksResult: Codable {
    let logo_url: HREFResult
}

struct HREFResult: Codable {
    let href: String
}
