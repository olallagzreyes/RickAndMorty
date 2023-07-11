//
//  CharactersRepositoryProtocol.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 23/6/23.
//

import Foundation

protocol CharactersRepositoryProtocol: HttpClient {
    func getAllCharacters(page: Int) async -> Result<CharactersDTO, ApiError>
    func getFilteredCharacters(page: Int, parameters: [String:String]) async -> Result<CharactersDTO, ApiError>
}
