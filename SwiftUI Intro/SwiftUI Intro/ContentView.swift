//
//  ContentView.swift
//  SwiftUI Intro
//
//  Created by Jestin Dorius on 5/1/25.
//

import SwiftUI

struct Pokemon {
    var name: String
    var isDisabled: Bool
}
extension Pokemon {
    static var dummyPokemon1Row = [
        Pokemon(name: "Cobaloin", isDisabled: false),
        Pokemon(name: "Terrakion", isDisabled: false)]
    
    static var dummyPokemon2Row = [
        Pokemon(name: "Virizion", isDisabled: false),
        Pokemon(name: "Keldeo", isDisabled: false)]
    
    @State static var allPokemon = ["Cobaloin", "Terrakion", "Virizion", "Keldeo"]
    
}

struct ContentView: View {
    
    @State var enabledButtons = [String]()
    @State var isHidden = Bool()
    @State var activeButton = String()
    
    @State var pokemonRow1 = Pokemon.dummyPokemon1Row
    @State var pokemonRow2 = Pokemon.dummyPokemon2Row
    @State var allPokemon = Pokemon.allPokemon
    
    var body: some View {
        ZStack(alignment: .top) {
            Color
                .black
                .ignoresSafeArea()
            
                
            VStack {
                Text("Favorite Swords of Justice")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(75)
                    
                HStack {
                    ForEach($pokemonRow1, id: \.name) { $pokemon in
                        PokemonRowView(pokemon: $pokemon, allPokemon: $allPokemon, isHidden: $isHidden)
                    }
                }
                HStack {
                    ForEach($pokemonRow2, id: \.name) { $pokemon in
                        PokemonRowView(pokemon: $pokemon, allPokemon: $allPokemon, isHidden: $isHidden)
                    }
                }
                Text("You picked \(allPokemon.joined())")
                    .foregroundStyle(!isHidden ? .black : .white)
                    .font(
                        .title2)
                createSubmitButton(
                    width: 200, pokemon: allPokemon)
                Spacer()
            }
            Spacer()
        }
    }
    
    func createSubmitButton(width: CGFloat, pokemon: [String]) -> some View {
        Button {
            
            if pokemon.count == 1 {
                isHidden.toggle()
            }
            
        } label: {
            Text("Submit Answers")
        }
        .frame(width: 150, height: 75)
        .buttonStyle(.borderedProminent)
        
    }
}

#Preview {
    ContentView()

}
