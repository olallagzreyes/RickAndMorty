//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import SwiftUI
import Factory

struct CharactersListView: View {
    
    @StateObject var vm: CharactersListViewModel = Container.shared.charactersVM()
    
    var body: some View {
        Group {
            switch vm.status {
            case .error:
                ErrorView(error: vm.error, action: vm.getCharacters)
            case .idle:
                VStack{
                    Image(Images.logo)
                        .resizable()
                        .frame(width: 180, height: 100)
                        .centerHorizontally()
                    HStack(alignment: .center){
                        
                        switch vm.filterType {
                        case .gender:
                            Picker("Gender", selection: $vm.selectedGender) {
                                
                                ForEach(CharacterGender.allCases, id: \.self) { gender in
                                    Text(gender.description)
                                        .tag(gender as CharacterGender?)
                                }
                            }
                            .onReceive(vm.$selectedGender, perform: { gender in
                                if gender != nil {
                                    Task {
                                        await vm.getCharacters()
                                    }
                                }
                            })
                            .pickerStyle(.segmented)
                        case .name, .none:
                            SearchBar(text: $vm.searchText)
                                .onReceive(vm.$searchText, perform: { text in
                                    if text.count > 3 {
                                        let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
                                            vm.filterType = .name
                                            vm.clearCharacters()
                                            Task {
                                                await vm.getCharacters()
                                            }
                                        }
                                    }
                                })
                        case .species:
                           Picker("Species", selection: $vm.selectedSpecie) {
                                
                                ForEach(CharacterSpecies.allCases, id: \.self) { species in
                                    Text(species.description)
                                        .tag(species as CharacterSpecies?)
                                }
                            }
                            .onReceive(vm.$selectedSpecie, perform: { specie in
                                if specie != nil {
                                    Task {
                                        await vm.getCharacters()
                                    }
                                }
                            })
                            .pickerStyle(.segmented)
                        case .status:
                            Picker("Status", selection: $vm.selectedStatus) {
                                
                                ForEach(CharacterStatus.allCases, id: \.self) { status in
                                    Text(status.description)
                                        .tag(status as CharacterStatus?)
                                }
                            }
                            .onReceive(vm.$selectedStatus, perform: { status in
                                if status != nil {
                                    Task {
                                        await vm.getCharacters()
                                    }
                                }
                            })
                            .pickerStyle(.segmented)
                        }
                        
                        Menu {
                            Button("Name", action: { vm.updateFilter(filter: .name) })
                            Button("Status", action: { vm.updateFilter(filter: .status) })
                            Button("Gender", action: { vm.updateFilter(filter: .gender) })
                            Button("Species", action: { vm.updateFilter(filter: .species) })
                        } label: {
                            Image(systemName: Images.SFSymbols.menu)
                        }
                    }
                    
                    .padding(10)
                    
                    List(vm.characters, id: \.id) { character in
                        CharacterRowView(character: character)
                            .task {
                                if character == vm.characters.last {
                                    await vm.getCharacters(restart: false)
                                }
                            }
                            .onTapGesture {
                                vm.selectedCharacter = character
                            }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await vm.getCharacters()
                    }
                }
            case .loading:
                ProgressView()
            }
        }
        .sheet(item: $vm.selectedCharacter) { character in
            CharacterDetailView(character: character)
        }
        .task {
          //  vm.status = .loading
            await vm.getCharacters(restart: true)
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
