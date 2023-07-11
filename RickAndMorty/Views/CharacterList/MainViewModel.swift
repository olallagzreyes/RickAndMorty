//
//  MainViewModel.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation
import Factory


class MainViewModel: ObservableObject {
    
    @Injected(\.charactersUseCase) private var useCase
    
    @Published var characters: [RMCharacter] = []
    @Published var searchText: String = ""
    @Published var selectedCharacter: RMCharacter?
    @Published var status: ViewStatus = .loading
    
    var error: String = ""
    private var page: Int = 1
    private var filterParameters: [String: String] = [:]
    
    @Published var filterType: CharacterFilters = .none
    @Published var selectedSpecie: CharacterSpecies = .human
    @Published var selectedGender: CharacterGender = .male
    @Published var selectedStatus: CharacterStatus = .alive
    @Published var isSearchingName: Bool = false
    
    @MainActor
    func getAllCharacters(restart: Bool = true) async {
        
        status = .loading
        
        if restart == true {
            clearCharacters()
        }
        
        let result = await useCase.getAllCharacters(page: page)
        
        switch result {
        case .success(let resultCharacters):
            characters += resultCharacters.sorted(by: { $0.name < $1.name })
            page += 1
            status = .idle
        case .failure(let failure):
            if case .notFound = failure {
                status = .idle
            } else {
                error = failure.localizedDescription
                print(failure.localizedDescription)
                print(failure.customMessage)
                clearCharacters()
                status = .error
            }
        }
    }
    
    @MainActor
    func getFilteredCharacters(restart: Bool = true) async {
        if restart == true {
            clearCharacters()
        }
        
        checkFilters()
        
        status = .loading
        
        let result = await useCase.getFilteredCharacters(page: page, parameters: filterParameters)
        isSearchingName = false
        
        switch result {
        case .success(let resultCharacters):
            characters = resultCharacters.sorted(by: { $0.name < $1.name })
            page += 1
            status = .idle
        case .failure(let failure):
            if case .notFound = failure {
                status = .idle
            } else {
                error = failure.localizedDescription
                print(failure.localizedDescription)
                print(failure.customMessage)
                clearCharacters()
                status = .error
            }
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
            filterParameters["gender"] = selectedGender.description
        case .name:
            filterParameters["name"] = searchText
        case .none:
            return
        case .species:
            filterParameters["species"] = selectedSpecie.description
        case .status:
            filterParameters["status"] = selectedStatus.description
            
        }
    }
    
    func updateFilter(filter: CharacterFilters) {
        page = 1
        filterType = filter
    }
    
    
    func filterByName(name: String) {
        if !isSearchingName {
            if name.count > 3 {
                isSearchingName = true
                let _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] (timer) in
                    guard let self = self else { return }
                    self.filterType = .name
                    self.clearCharacters()
                    Task {
                        await self.getFilteredCharacters()
                    }
                }
            } else if name.count == 0 {
                if filterType == .name {
                    clearCharacters()
                    filterType = .none
                    Task {
                        await getAllCharacters(restart: true)
                    }
                }
            }
        }
    }
    
}
