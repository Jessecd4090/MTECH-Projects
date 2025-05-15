//
//  DragonOverView.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//

import SwiftUI

struct DragonOverView: View {
    
    let dragon: Dragon
    @State var router = RootRouter()
    @AppStorage("defaultOn") var defaultOn = true
    
    var body: some View {
                    VStack{
                        Text(dragon.name)
                            .font(.largeTitle)

            Text("Species: \(dragon.species)")
            Text("Pokedex #\(dragon.id)")
            
            Image(dragon.name)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
        }
        .background(defaultOn ? Color.white.ignoresSafeArea() : Color.cyan.ignoresSafeArea())
            
            VStack {
                Text("Description")
                    .frame(width: 350, alignment: .leading)
                    .font(.title2)
                    .padding()
                Text(dragon.description)
                    .frame(width: 350)
                Spacer()
                Text("Abilities")
                    .frame(width: 350)
                    .font(.title2)
                    .padding(15)
                Button {
                    router.navigate(to: .abilities(dragon: dragon))
                    print(dragon.abilities)
                } label: {
                    Text("\(dragon.abilities[0])")
                }
                Spacer()
            }
            .padding()
            .background(Color.green)
            
        
    }
        
}

#Preview {
    DragonOverView(dragon: Dragon.dragons[0])
}
