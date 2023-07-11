//
//  CharactersUseCase.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 24/6/23.
//

import Foundation
import Factory

struct CharactersUseCase {
    
    @Injected(\.characterRepository) private var repository
    
    func getAllCharacters(page: Int) async -> Result<[RMCharacter], ApiError> {
        return await repository.getAllCharacters(page: page).map({$0.characters.map({$0.toDomain()})})
    }
    
    func getFilteredCharacters(page: Int, parameters: [String: String]) async -> Result<[RMCharacter], ApiError> {
        return await repository.getFilteredCharacters(page: page, parameters: parameters).map({$0.characters.map({$0.toDomain()})})
    }
    
}
