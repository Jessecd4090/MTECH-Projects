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
    @State static var dummyPokemon1Row = [
        Pokemon(name: "Cobaloin",
                isDisabled: false),
        Pokemon(name: "Terrakion",
                isDisabled: false)]
    
    static var dummyPokemon2Row = [
        Pokemon(name: "Virizion",
                isDisabled: false),
        Pokemon(name: "Keldeo",
                isDisabled: false)]
    
    @State static var allPokemon = ["Cobaloin", "Terrakion", "Virizion", "Keldeo"]
    @State static var favoritePokemon = String()
    
    @State static var TESTPokemon = String()
    
}

struct ContentView: View {
    
    @State var isHidden = Bool()
    @State var pokemonRow1 = Pokemon.dummyPokemon1Row
    @State var pokemonRow2 = Pokemon.dummyPokemon2Row
    @State var allPokemon = Pokemon.allPokemon
    @State var favoritePokemon = Pokemon.favoritePokemon
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Favorite Sword of Justice \n (Pokemon)")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                HStack {
                    ForEach($pokemonRow1, id: \.name) { $pokemon in
                        PokemonRowView(pokemon: $pokemon, allPokemon: $allPokemon, favoritePokemon: $favoritePokemon, isHidden: $isHidden)
                    }
                }
                HStack {
                    ForEach($pokemonRow2, id: \.name) { $pokemon in
                        PokemonRowView(pokemon: $pokemon, allPokemon: $allPokemon, favoritePokemon: $favoritePokemon, isHidden: $isHidden)
                    }
                }
                Text("You picked \(favoritePokemon)")
                    .foregroundStyle(!isHidden ? .black : .white)
                    .font(
                        .largeTitle)
                    .padding()
                createSubmitButton(
                    width: 300, pokemon: allPokemon)
                Spacer()
            }
            Spacer()
        }
    }
    
    func createSubmitButton(width: CGFloat, pokemon: [String]) -> some View {
        Button {
            
            if !favoritePokemon.isEmpty {
                isHidden.toggle()
            }
//            if pokemon.count == 1 {
//                isHidden.toggle()
//            }
            
        } label: {
            Text("Submit Answers")
                .font(.title2)
        }
        .frame(width: width, height: 75)
        .buttonStyle(.borderedProminent)
        
    }
}

#Preview {
    ContentView()

}
