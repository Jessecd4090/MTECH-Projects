//
//  Dragon.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//
import SwiftUI

struct Dragon: Identifiable, Hashable {
    var id: Int
    var name: String
    var species: String
    var largeImage: Image {
        Image(name)
    }
    var abilities: [String]
    var abilityDescription: String
    var description: String
    @State static var dragons = [
        Dragon(id: 6,
               name: "Charizard",
               species: "Flame Pokemon",
               abilities: ["Blaze"],
               abilityDescription: "Blaze increases the power of Fire-type moves by 50% (1.5×) when the ability-bearer's HP falls below a third of its maximum (known in-game as in a pinch).",
               description: "Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally."),
        Dragon(id: 149,
               name: "Dragonite",
               species: "Dragon Pokemon",
               abilities: ["Inner Focus"],
               abilityDescription: "Inner Focus prevents the Pokémon from flinching, for example when attacked by a move like Headbutt.",
               description: "It is said that this Pokemon constantly flies over the immense seas and rescues drowning people."),
        Dragon(id: 384,
               name: "Rayquaza",
               species: "Sky High Pokemon",
               abilities: ["Air Lock"],
               abilityDescription: "Air Lock suppresses all effects brought on by weather, including move power increases, end-of-turn damage, accuracy changes, relevant abilities and so on.",
               description: "Rayquaza lived for hundreds of millions of years in the earth’s ozone layer, never descending to the ground. This Pokemon appears to feed on water and particles in the atmosphere."),
        Dragon(id: 483,
               name: "Dialga",
               species: "Temporal Pokemon",
               abilities: ["Pressure"],
               abilityDescription: "Pressure makes any attack targeted at the ability-bearer - regardless of whether it hits - use 2 PP instead of 1.",
               description: "A Pokémon spoken of in legend. It is said that time began moving when Dialga was born."),
        Dragon(id: 487,
               name: "Giratina",
               species: "Renegade Pokemon",
               abilities: ["Pressure"],
               abilityDescription: "Pressure makes any attack targeted at the ability-bearer - regardless of whether it hits - use 2 PP instead of 1.",
               description: "It was banished for its violence. It silently gazed upon the old world from the Distortion World.")]
}
