//
//  CharactersEndpoints.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation

enum CharactersEndpoints: Equatable {
    case getAllCharacters(page: Int)
    case getFilteredCharacters(page: Int, parameters: [String:String])
}

extension CharactersEndpoints: Endpoint {
    var path: String {
        switch self {
        case .getAllCharacters:
           return Path.Characters.getAll
        case .getFilteredCharacters:
            return Path.Characters.getAll
        }
    }
    
    public var parameters: [URLQueryItem]? {
        switch self {
        case .getAllCharacters(let page):
            let params: [URLQueryItem] = [URLQueryItem(name: "page", value: String(page))]
            return params
        case .getFilteredCharacters(let page, let parameters):
            var params: [URLQueryItem] = [URLQueryItem(name: "page", value: String(page))]
            params.append(contentsOf: parameters.map({ URLQueryItem(name: $0.key, value: $0.value)}))
            print("PARAMS: \(params)")
            return params
        }
    }
}

