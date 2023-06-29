//
//  Character.swift
//  AnimeMVVM
//
//  Created by Esther on 6/29/23.
//

import Foundation

struct CharacterTLD: Decodable {
    let data: CharacterData
}

struct CharacterData: Decodable {
    let id: String
    let attributes: Attributes
}

struct Attributes: Decodable {
    private enum CodingKeys: String, CodingKey {
        case canonicalName
        case imageDictionary = "image"
        case characterID = "malID"
        case description
    }
    
    let canonicalName: String
    let imageDictionary: ImageDictionary
    let characterID: String
    let description: String
}

struct ImageDictionary: Decodable {
    // The image url I need for my fetch image
    let medium: String
}


