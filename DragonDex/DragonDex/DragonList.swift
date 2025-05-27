//
//  DragonList.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//

import SwiftUI

struct DragonList: View {
    @State var dragons = Dragon.dragons
    @State private var router = RootRouter()
    @EnvironmentObject var settings: AppSettings
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            Spacer()
            Text("Dragon List")
                .font(.largeTitle)
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
            .scrollContentBackground(.hidden)
            .background(settings.backgroundColor)
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
            
            /// Need to still fix this
//            defaultOn ? Color.white : Color.cyan
            
        }
        .environment(router)
    }
}

#Preview {
    DragonList()
}
