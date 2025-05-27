//
//  DragonAbilities.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//

import SwiftUI

struct DragonAbilities: View {
    let dragon: Dragon
    @State var router = RootRouter()
    @EnvironmentObject var settings: AppSettings
    
    var body: some View {
        VStack {
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
                        .frame(width: 400)
                        .padding()
                }
                Spacer()
            }
            
        }
        .background(settings.backgroundColor)
    }
}

#Preview {
    DragonAbilities(dragon: Dragon.dragons[0])
        .environmentObject(AppSettings())
}
