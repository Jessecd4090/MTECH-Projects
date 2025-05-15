//
//  DragonAbilities.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//

import SwiftUI

struct DragonAbilities: View {
    @State var dragon: Dragon
    var body: some View {
        Text("\(dragon.name) Abilities")
            .font(.largeTitle)
        
        Image(dragon.name)
            .resizable()
            .scaledToFit()
        VStack {
            
            ForEach(dragon.abilities, id: \.self) { thing in
                Text(thing)
                    .font(.title)
                Text(dragon.abilityDescription)
                    .frame(width: 350)
            }
            Spacer()
        }
    }
}

#Preview {
    DragonAbilities(dragon: Dragon.dragons[0])
}
