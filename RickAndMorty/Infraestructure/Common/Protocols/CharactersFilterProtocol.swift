//
//  CharactersFilterProtocol.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation

protocol CharactersFilterProtocol: Hashable, Identifiable, CaseIterable, Equatable {
    var id: String { get }
    var description: String { get }
    func getImage() -> String
}
