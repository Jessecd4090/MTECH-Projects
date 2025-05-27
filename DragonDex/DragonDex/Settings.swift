//
//  Settings.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var settings: AppSettings
    
    var body: some View {
        ZStack {
            VStack {
                
                Text("Settings")
                    .font(.largeTitle)
                Spacer()
                ColorPicker("Background Color", selection: $settings.backgroundColor)
                    .frame(width: 235, height: 150)
                    .padding(100)
                
                Spacer()
                    
            }
            .background(settings.backgroundColor)

            
        }
    }
    // defaultOn ? defaultColor : changedColor
}

class AppSettings: ObservableObject {
    @Published var backgroundColor: Color = .white
}


#Preview {
    Settings()
        .environmentObject(AppSettings())
}
