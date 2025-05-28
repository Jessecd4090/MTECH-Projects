//
//  RandomAPIsPart_2App.swift
//  RandomAPIsPart-2
//
//  Created by Jestin Dorius on 5/17/25.
//

import SwiftUI

@main
struct RandomAPIsPart_2App: App {
    var body: some Scene {
        WindowGroup {
            
            DogView(dogData: DogData(image: "TEST"))
        }
    }
    func getDog() {
        Task {
            do {
                let dogData = await DogNetwork.getDogFromAPI()
                let dogImageURL = dogData.image
                let dogImage = await DogNetwork.getDogPic(url: dogImageURL)
                print(dogImage)
            }
        }
    }
}
