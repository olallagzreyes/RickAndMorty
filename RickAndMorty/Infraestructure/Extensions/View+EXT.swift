//
//  View+EXT.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import SwiftUI

extension View {
    
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func leadingHorizontally() -> some View {
        HStack {
            self
            Spacer()
        }
    }
    
    func trailingHorizontally() -> some View {
        HStack {
            Spacer()
            self
        }
    }
    
    func centerVertically() -> some View {
        VStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
