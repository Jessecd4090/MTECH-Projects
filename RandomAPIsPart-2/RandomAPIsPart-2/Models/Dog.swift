//
//  Dog.swift
//  RandomAPIsPart-2
//
//  Created by Jestin Dorius on 5/28/25.
//

import Foundation
import UIKit
import SwiftUI

struct Dog: Identifiable {
    var id = UUID()
    var name: String
    var image: UIImage
    
    
    @State static var dummyDog = Dog(name: "TEST-1", image: UIImage(systemName: "person")!)
    
}
