//
//  CharactersPicker.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import SwiftUI

struct CharactersPicker<T: CharactersFilterProtocol>: View {
    
    @EnvironmentObject var vm: MainViewModel
    
    var title: String
    var list: T.AllCases
    @Binding var selectedElement: T
    
    
    var body: some View {
        Picker(title, selection: $selectedElement) {
            ForEach(Array(list), id: \.self) { element in
                Text(element.description)
                    .tag(element as T?)
            }
        }
        .onChange(of: selectedElement, perform: { element in
                Task {
                    await vm.getFilteredCharacters()
                }
        })
        .pickerStyle(.segmented)
    }
}

