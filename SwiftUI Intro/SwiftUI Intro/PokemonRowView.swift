//
//  PokemonRowView.swift
//  SwiftUI Intro
//
//  Created by Jestin Dorius on 5/9/25.
//

import Foundation
import SwiftUI

struct PokemonRowView: View {
    @Binding var pokemon: Pokemon
    @Binding var allPokemon: [String]
    @Binding var isHidden: Bool
    var body: some View {
            Button {
                pokemon.isDisabled.toggle()
                if isHidden == false {
                    if allPokemon.contains(where: { $0 == pokemon.name }) {
                        allPokemon.removeAll(where: { $0 == pokemon.name })
                    } else {
                        allPokemon.append("\(pokemon.name)")
                    }
                } else {
                    if allPokemon.contains(where: { $0 == pokemon.name }) {
                        allPokemon.removeAll(where: { $0 == pokemon.name })
                    } else {
                        allPokemon.append("\(pokemon.name)")
                    }
                    isHidden.toggle()
                }
                print(allPokemon)
            } label: {
                Text("\(pokemon.name)")
                    .foregroundStyle(.white)
            }
            .frame(
                width: 100,
                height: 100)
            
//            .disabled(pokemon.isDisabled)
            .background(pokemon.isDisabled ? .gray : .green)
            .cornerRadius(24)
            
            .padding()
    }
}
