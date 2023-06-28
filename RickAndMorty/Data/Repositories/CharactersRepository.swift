//
//  CharactersRepository.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation

class CharactersRepository: CharactersRepositoryProtocol {
    
    func getAllCharacters(page: Int, parameters: [String:String]) async -> Result<CharactersDTO, ApiError> {
        return await sendRequest(endpoint: CharactersEndpoints.getAllCharacters(page: page, parameters: parameters), responseModel: CharactersDTO.self)
    }
}
