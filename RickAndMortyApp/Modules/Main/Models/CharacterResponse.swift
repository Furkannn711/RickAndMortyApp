//
//  CharacterResponse.swift
//  RickAndMortyApp
//
//  Created by furkan on 16.02.2024.
//

import Foundation


struct CharacterResponse: Decodable{
    let info: CharacterInfoResponse?
    let results: [CharacterResultsResponse]?
}

struct CharacterInfoResponse: Decodable {
    let next: String?
    let prev: String?
}

struct CharacterResultsResponse: Decodable {
    let id: Int?
    let name: String?
    let status: StatusType?
    let species: String?
    let gender: String?
    let image: URL?
    
    init() {
        self.id = 0
        self.name = ""
        self.status = .unknown
        self.species = ""
        self.gender = ""
        self.image = URL(string: "")
    }
}

enum StatusType: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}
