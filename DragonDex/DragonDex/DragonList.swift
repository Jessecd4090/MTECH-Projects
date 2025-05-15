//
//  DragonList.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//

import SwiftUI

struct DragonList: View {
    @State var dragons = Dragon.dragons
    @State var router = RootRouter()
    @AppStorage("defaultOn") var defaultOn = true
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            Spacer()
            Text("Dragon List")
                .font(.largeTitle)
            ZStack {
                defaultOn ? Color.cyan : Color.white
                List {
                    ForEach(dragons) { dragon in
                        Button {
                            router.navigate(to: .detail(dragon: dragon))
                        } label: {
                            HStack{
                                Image(dragon.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text(dragon.name)
                                    .font(.title3)
                            }
                        }
                    }
                    
                }
                
                .navigationDestination(for: RootRouter.Route.self) { route in
                    router.view(for: route)
                }
                
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            router.navigate(to: .settings)
                        } label: {
                            Image(systemName: "gear.circle")
                        }
                    }
                })
                
            }
            
        }
        
        .environment(router)
    }
}

#Preview {
    DragonList(defaultOn: Settings().defaultOn)
}
