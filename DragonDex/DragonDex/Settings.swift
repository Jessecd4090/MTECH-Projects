//
//  Settings.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//

import SwiftUI

struct Settings: View {
    @AppStorage("defaultOn") var defaultOn = true
    @State var defaultColor = Color.white
    @State var changedColor = Color.cyan
    var body: some View {
        ZStack {
            if defaultOn == false {
                changedColor.ignoresSafeArea()
            }
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                Spacer()
                Button {
                    defaultOn.toggle()
                    print(defaultOn)
                } label: {
                    Text("Change Background Color")
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            
        }
    }
    // defaultOn ? defaultColor : changedColor
}


#Preview {
    Settings()
}
