//
//  CharacterGender.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 28/6/23.
//

import Foundation


enum CharacterGender: CharactersFilterProtocol {
    case female
    case male
    case unknown
    
    var id: String { self.description }
    
    init?(value: String) {
        switch value.lowercased() {
        case "female":
            self = .female
        case "male":
            self = .male
        default:
            self = .unknown
        }
    }
    
    var description: String {
        switch self {
        case .female:
            return "Female"
        case .male:
            return "Male"
        case .unknown:
            return "Unknown"
        }
    }
    
    func getImage() -> String {
        switch self {
        case .female:
            return Images.woman
        case .male:
            return Images.man
        case .unknown:
            return Images.unkwnown
        }
    }
}
