//
//  SearchBar.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 27/6/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            
            TextField("Search a character by its name", text: $text)
                .padding(7)
                .padding(.horizontal, 5)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.leading, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button {
                    self.isEditing = false
                    self.text = ""
                } label: {
                    Image(systemName: Images.SFSymbols.close)
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 5)
                .animation(.spring(response: 1.5), value: true)
            }
        }
    }
}
