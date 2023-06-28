//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 28/6/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    let character: RMCharacter
    
    var body: some View {
        VStack(spacing: 10) {
            
            if let url = URL(string: character.imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
            }
            VStack {
                Text(character.name)
                    .font(.largeTitle)
                HStack{
                    Text(character.origin)
                    Text("-")
                    Text(character.location)
                }
                .font(.caption2)
                
                if !character.type.isEmpty {
                    Text(character.type)
                }
                
                
                VStack{
                    HStack{
                        Text(character.specie.description)
                        Spacer()
                        Image(character.specie.getImage())
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                    HStack{
                        Text(character.gender.description)
                        Spacer()
                        Image(character.gender.getImage())
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                    HStack{
                        Text(character.status.description)
                        Spacer()
                        Image(character.status.getImage())
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
                
                
                Text("Its being present in \(character.episodes.count) episodes")
                    .font(.footnote)
                Spacer()
            }
        }
    }
}

