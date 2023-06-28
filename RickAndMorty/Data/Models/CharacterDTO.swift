//
//  CharacterDTO.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 23/6/23.
//

import Foundation

struct CharacterDTO: Codable, Identifiable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let characterLocation: CharacterLocation
    let imageUrl: String
    let episodes: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, status, species, type, gender, origin, url, created
        case characterLocation = "location"
        case imageUrl = "image"
        case episodes = "episode"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        status = try values.decode(String.self, forKey: .status)
        species = try values.decode(String.self, forKey: .species)
        type = try values.decode(String.self, forKey: .type)
        gender = try values.decode(String.self, forKey: .gender)
        origin = try values.decode(Origin.self, forKey: .origin)
        characterLocation = try values.decode(CharacterLocation.self, forKey: .characterLocation)
        imageUrl = try values.decode(String.self, forKey: .imageUrl)
        episodes = try values.decode([String].self, forKey: .episodes)
        url = try values.decode(String.self, forKey: .url)
        created = try values.decode(String.self, forKey: .created)
    }
    
    func toDomain() -> RMCharacter {
        return RMCharacter(id: id, name: name, status: CharacterStatus(value: status) ?? .unknown, specie: CharacterSpecies(value: species) ?? .alien, type: type, gender: CharacterGender(value: gender) ?? .unknown, origin: origin.name, location: characterLocation.name, imageUrl: imageUrl, episodes: episodes, url: url)
    }
}


struct Origin: Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        url = try values.decode(String.self, forKey: .url)
    }
}

struct CharacterLocation: Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        url = try values.decode(String.self, forKey: .url)
    }
}

