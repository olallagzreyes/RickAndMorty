//
//  CharacterStatus.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 28/6/23.
//

import Foundation

enum CharacterStatus: Hashable, CaseIterable, Identifiable {
    case alive
    case dead
    case unknown
    
    var id: String { self.description }
    
    init?(value: String) {
        switch value.lowercased() {
        case "alive":
            self = .alive
        case "dead":
            self = .dead
        default:
            self = .unknown
        }
    }
    
    var description: String {
        switch self {
        case .alive:
            return "Alive"
        case .dead:
            return "Dead"
        case .unknown:
            return "Unknown"
        }
    }
    
    func getImage() -> String {
        switch self {
        case .alive:
            return Images.alive
        case .dead:
            return Images.dead
        case .unknown:
            return Images.unkwnown
        }
    }
}

