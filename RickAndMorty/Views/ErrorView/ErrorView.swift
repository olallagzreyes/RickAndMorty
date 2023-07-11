//
//  ErrorView.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 28/6/23.
//

import SwiftUI

struct ErrorView: View {
    
    let error: String
    let action: (Bool) async -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Spacer()
            Image(Images.sadFace)
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundStyle(.yellow)
            Text("Something has happened")
                .font(.title3)
            Text(error)
                .font(.callout)
            Spacer(minLength: 40)
            Button {
                Task {
                    await action(true)
                }
            } label: {
                Text("Try it again")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            .buttonStyle(.plain)
            Spacer()
        }
    }
}
