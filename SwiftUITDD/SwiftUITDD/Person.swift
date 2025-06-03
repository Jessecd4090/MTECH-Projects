//
//  Person.swift
//  SwiftUITDD
//
//  Created by Jestin Dorius on 6/3/25.
//
import Foundation
import SwiftUI

struct Person: Identifiable {
    var id: UUID = UUID()
    var image: Image = Image(systemName: "person.fill")
    var firstName: String
    var lastName: String
    var age: Int
    var fullName: String {
        firstName + " " + lastName
    }
    
    var intro: String {
        "Hello, my name is \(firstName) \(lastName), and I am \(age) years old!"
    }
    func ageGet() -> Int {
        return age
    }
    
    func capFirstName() -> String {
        guard var firstLetter = firstName.first?.uppercased() else { return "FAILED TO CAPITALIZE" }
        let remaining = firstName.dropFirst()
        return firstLetter + remaining
    }
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}


