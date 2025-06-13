//
//  People.swift
//  GeometryReader
//
//  Created by Jestin Dorius on 5/29/25.
//

import Foundation
import UIKit

struct People {
    var name: String
    var image: UIImage = UIImage(systemName: "person.fill")!
    var description: String
    
    
    static var practicePeople = [
        People(
            name: "Jesse",
            description: "iOS Developer"),
        People(
            name: "Caleb",
            description: "Drummer"),
        People(
            name: "Emma",
            description: "Hair Stylist"),
        People(
            name: "Jestin",
            description: "Ventilation tech"),
        People(
            name: "Heather",
            description: "Elderly Caretaker"),
        People(
            name: "Cass",
            description: "Sales Rep"),
        People(
            name: "Fake Person",
            description: "Nice"),
        People(name: "Fake 2 Person", description: "Cool")]
}
