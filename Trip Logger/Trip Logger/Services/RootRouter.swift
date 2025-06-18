//
//  RootRouter.swift
//  Trip Logger
//
//  Created by Jestin Dorius on 6/17/25.
//

import Foundation
import SwiftUI

@Observable
class RootRouter {
    var navigationPath = NavigationPath()
    
    
    enum Route: Hashable {
        case newTripScreen
        case placePinScreen(trip: Trip)
        case setUpPinScreen(trip: Trip)
        case tripMapScreen(trip: Trip)
    }
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .newTripScreen:
            NewTripScreen()
        case .placePinScreen(trip: let trip):
            PlacePinScreen(trip: trip)
        case .setUpPinScreen(trip: let trip):
            SetUpPinScreen(trip: trip)
        case .tripMapScreen(trip: let trip):
            TripMapScreen(trip: trip, position: .automatic, tripName: trip.name)
        }
    }
    
    func navigate(to route: Route) {
        navigationPath.append(route)
        print(navigationPath)
    }
}
