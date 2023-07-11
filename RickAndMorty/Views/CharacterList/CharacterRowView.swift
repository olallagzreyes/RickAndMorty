//
//  CharacterRowView.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import SwiftUI

struct CharacterRowView: View {
    
    let character: RMCharacter
    
    var body: some View {
        HStack {
            if let url = URL(string: character.imageUrl) {
                CacheAsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 30, height: 30)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 10)
                    case .failure:
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .background(.gray)
                    case .empty:
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    @unknown default:
                        Image(systemName: "questionmark")
                    }
                    }
                    VStack {
                        Text(character.name)
                            .font(.callout)
                            .leadingHorizontally()
                        Text(character.type)
                            .font(.caption)
                            .leadingHorizontally()
                    }
                    .padding(.leading, 20)
                }
            }
        }
        
    }
