//
//  CharactersListViewModel.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation
import Factory


class CharactersListViewModel: ObservableObject {
    
    @Injected(\.charactersUseCase) private var useCase
    
    @Published var characters: [RMCharacter] = []
    @Published var searchText: String = ""
    @Published var selectedCharacter: RMCharacter?
    @Published var status: ViewStatus = .idle
   
    var error: String = ""
    private var page: Int = 1
    private var filterParameters: [String: String] = [:]
  
    @Published var filterType: CharacterFilters = .none
    @Published var selectedSpecie: CharacterSpecies?
    @Published var selectedGender: CharacterGender?
    @Published var selectedStatus: CharacterStatus?
    
    @MainActor
    func getCharacters(restart: Bool = true) async {
        
        if restart == true {
            clearCharacters()
        }
        
        checkFilters()
        
        let result = await useCase.getAllCharacters(page: page, parameters: filterParameters)
        
        switch result {
        case .success(let resultCharacters):
            characters += resultCharacters
            page += 1
           // status = .idle
        case .failure(let failure):
            error = failure.localizedDescription
            print(failure.localizedDescription)
            print(failure.customMessage)
            clearCharacters()
            status = .error
        }
    }
    
    func clearCharacters() {
        page = 1
        characters.removeAll()
    }
    
    func checkFilters() {
        filterParameters.removeAll()
        
        switch filterType {
        case .gender:
            filterParameters["gender"] = selectedGender?.description
        case .name:
            filterParameters["name"] = searchText
        case .none:
            return
        case .species:
            filterParameters["species"] = selectedSpecie?.description
        case .status:
            filterParameters["status"] = selectedStatus?.description
      
        }
    }
    
    func updateFilter(filter: CharacterFilters) {
        page = 1
        filterType = filter
    }
    
}
