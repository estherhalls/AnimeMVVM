//
//  CharacterList.swift
//  AnimeMVVM
//
//  Created by Esther on 6/29/23.
//

import Foundation

struct ListTLD: Decodable {
    let data: [CharacterDataDictionary]
    let meta: Meta
    let links: Links
}

struct CharacterDataDictionary: Decodable {
    let id: String
    let relationships: Relationship
}

struct Meta: Decodable {
    let count: Int
}

struct Links: Decodable {
    let first: String
    let next: String
    let last: String
}

struct Relationship: Decodable {
    let character: Character
}

struct Character: Decodable {
    let links: CharacterLinks
}

struct CharacterLinks: Decodable {
    // This is the URL I need to fetch the single character data
    let related: String
}

// Endpoint: https://kitsu.io/api/edge/anime/176/characters
