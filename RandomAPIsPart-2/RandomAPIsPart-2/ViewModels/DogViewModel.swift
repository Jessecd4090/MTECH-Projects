//
//  DogViewModel.swift
//  RandomAPIsPart-2
//
//  Created by Jestin Dorius on 5/28/25.
//

import Foundation
import SwiftUI
import UIKit
@Observable
class DogViewModel {
    var dogPic = UIImage()
    var dogName = String()
    var dogs = [Dog]()
    var animationToggle = Bool()
    
    
    // API Call
    func getDog() {
        Task {
            do {
                let dogData = await DogNetwork.getDogFromAPI()
                let dogImageURL = dogData.image
                dogPic = await DogNetwork.getDogPic(url: dogImageURL)
                print(dogPic)
            }
        }
    }
}
