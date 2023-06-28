//
//  Container+EXT.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation
import Factory

extension Container {
    
    // Use Cases
    var charactersUseCase: Factory<CharactersUseCase> { self { CharactersUseCase() }}
    
    // Repositories
    var characterRepository: Factory<CharactersRepository> { self { CharactersRepository() }}
     
     // ViewModels
    var charactersVM: Factory<CharactersListViewModel> { self { CharactersListViewModel() }}
}

