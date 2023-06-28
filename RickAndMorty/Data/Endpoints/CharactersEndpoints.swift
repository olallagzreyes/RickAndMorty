//
//  CharactersEndpoints.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation

enum CharactersEndpoints: Equatable {
    case getAllCharacters(page: Int, parameters: [String:String])
}

extension CharactersEndpoints: Endpoint {
    var path: String {
        switch self {
        case .getAllCharacters:
           return Path.Characters.getAll
        }
    }
    
    public var parameters: [URLQueryItem]? {
        switch self {
        case .getAllCharacters(let page, let parameters):
            print("PAGE: \(page)")
            print("PARAMETERS: \(parameters)")
            var params: [URLQueryItem] = parameters.map({ URLQueryItem(name: $0.key, value: $0.value)})
            params.append(URLQueryItem(name: "page", value: String(page)))
            return params
        }
    }
}

