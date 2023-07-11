//
//  MainView.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import SwiftUI
import Factory

struct MainView: View {
    
    @StateObject var vm: MainViewModel = Container.shared.mainVM()
    
    
    func getCharacters() async {
        if vm.filterType == .none {
            await vm.getAllCharacters(restart: false)
        } else {
            await vm.getFilteredCharacters(restart: false)
        }
    }
    
    var body: some View {
        VStack {
            HeeaderListView()
                .environmentObject(vm)
            Group {
                switch vm.status {
                case .error:
                    ErrorView(error: vm.error, action: vm.getAllCharacters)
                case .idle:
                    List(vm.characters, id: \.id) { character in
                        CharacterRowView(character: character)
                            .task {
                                if character == vm.characters.last {
                                    //await getCharacters()
                                }
                            }
                            .onTapGesture {
                                vm.selectedCharacter = character
                            }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await getCharacters()
                    }
                case .loading:
                    VStack{
                        Spacer()
                        ProgressView()
                            .opacity(0.3)
                        Spacer()
                    }
                }
            }
            .onAppear {
                Task {
                    await vm.getAllCharacters()
                }
            }
            .sheet(item: $vm.selectedCharacter) { character in
                CharacterDetailView(character: character)
            }
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
