//
//  HeeaderListView.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import SwiftUI

struct HeeaderListView: View {
    
    @EnvironmentObject var vm: MainViewModel
    
    var body: some View {
        Image(Images.logo)
            .resizable()
            .frame(width: 180, height: 100)
            .centerHorizontally()
        HStack(alignment: .center){
            
            switch vm.filterType {
            case .gender:
                CharactersPicker(title: "Gender", list: CharacterGender.allCases, selectedElement: $vm.selectedGender)
                    .environmentObject(vm)
            case .name, .none:
                SearchBar(text: $vm.searchText)
                    .onChange(of: vm.searchText, perform: { text in
                        vm.filterByName(name: text)
                    })
            case .species:
                CharactersPicker(title: "Species", list: CharacterSpecies.allCases, selectedElement: $vm.selectedSpecie)
                    .environmentObject(vm)
            case .status:
                CharactersPicker(title: "Status", list: CharacterStatus.allCases, selectedElement: $vm.selectedStatus)
                    .environmentObject(vm)
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
    }
}

struct HeeaderListView_Previews: PreviewProvider {
    static var previews: some View {
        HeeaderListView()
    }
}
