//
//  CharacterSpecies.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 28/6/23.
//

import Foundation

enum CharacterSpecies: Hashable, Identifiable, CaseIterable {
   
    case human
    case alien
    
    var id: String { self.description }
    
    init?(value: String) {
        switch value {
        case "Human":
            self = .human
        case "Alien":
            self = .alien
        default:
            self = .human
        }
    }
    
    var description: String {
        switch self {
        case .human:
            return "Human"
        case .alien:
            return "Alien"
        }
    }
    
    func getImage() -> String {
        switch self {
        case .human:
            return Images.human
        case .alien:
            return Images.alien
        }
    }
}
