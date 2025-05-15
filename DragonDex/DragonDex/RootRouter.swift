//
//  RootRouter.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//

import Foundation
import SwiftUI

@Observable
class RootRouter {
    var navigationPath = NavigationPath()
    
    enum Route: Hashable {
        case detail(dragon: Dragon)
        case abilities(dragon: Dragon)
        case settings
    }
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .detail(dragon: let dragon):
            DragonOverView(dragon: dragon)
        case .settings:
            Settings()
        case .abilities(dragon: let dragon):
            DragonAbilities(dragon: dragon)
        }
    }
    
    func navigate(to route: Route) {
        navigationPath.append(route)
        print(navigationPath)
    }
}
