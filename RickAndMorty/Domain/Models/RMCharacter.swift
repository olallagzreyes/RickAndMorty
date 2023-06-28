//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 24/6/23.
//

import Foundation

struct RMCharacter: Identifiable, Hashable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let specie: CharacterSpecies
    let type: String
    let gender: CharacterGender
    let origin: String
    let location: String
    let imageUrl: String
    let episodes: [String]
    let url: String
    
    init(id: Int, name: String, status: CharacterStatus, specie: CharacterSpecies, type: String, gender: CharacterGender, origin: String, location: String, imageUrl: String, episodes: [String], url: String) {
        self.id = id
        self.name = name
        self.status = status
        self.specie = specie
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.imageUrl = imageUrl
        self.episodes = episodes
        self.url = url
    }
    
    public static func == (lhs: RMCharacter, rhs: RMCharacter) -> Bool {
          return lhs.id == rhs.id
      }
}
