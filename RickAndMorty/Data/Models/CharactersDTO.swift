//
//  CharactersDTO.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation

struct CharactersDTO: Codable {
    
    var infoList: InfoList
    var characters: [CharacterDTO]
    
    enum CodingKeys: String, CodingKey {
        case infoList = "info"
        case characters = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        infoList = try values.decode(InfoList.self, forKey: .infoList)
        characters = try values.decode([CharacterDTO].self, forKey: .characters)
    }
}

struct InfoList: Codable {
    
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count, pages, next, prev
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decode(Int.self, forKey: .count)
        pages = try values.decode(Int.self, forKey: .pages)
        next = try values.decode(String?.self, forKey: .next)
        prev = try values.decode(String?.self, forKey: .prev)
    }
    
}

