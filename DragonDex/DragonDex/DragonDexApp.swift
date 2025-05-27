//
//  DragonDexApp.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//

import SwiftUI

@main
struct DragonDexApp: App {
    @StateObject var settings = AppSettings()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            DragonList()
                .environmentObject(settings)
        }
    }
}
