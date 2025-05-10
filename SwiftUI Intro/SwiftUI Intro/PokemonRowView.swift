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
    @Binding var favoritePokemon: String
    
    @Binding var isHidden: Bool
    var body: some View {
        Button {
            
            if favoritePokemon.isEmpty {
                pokemon.isDisabled.toggle()
                if pokemon.isDisabled == true {
                    favoritePokemon.append(pokemon.name)
                }
            } else {
                favoritePokemon.removeAll()
            }
            print(favoritePokemon)
        } label: {
            Text("\(pokemon.name)")
                .foregroundStyle(.white)
                .font(.system(size: 30))
        }
        .frame(width: 150, height: 150)
        .background(favoritePokemon == pokemon.name ? .green : .gray)
        .cornerRadius(24)
        .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PokemonRowView(pokemon: Pokemon.$dummyPokemon1Row[0], allPokemon: Pokemon.$allPokemon, favoritePokemon: Pokemon.$TESTPokemon, isHidden: Pokemon.$dummyPokemon1Row[0].isDisabled)
}
