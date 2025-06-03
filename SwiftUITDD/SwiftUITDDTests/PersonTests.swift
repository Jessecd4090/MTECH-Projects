//
//  PersonTests.swift
//  SwiftUITDDTests
//
//  Created by Jestin Dorius on 6/3/25.
//

import Foundation
import XCTest
@testable import SwiftUITDD

class PersonTests: XCTestCase {
    
    // Name Tests
    func testFullName() {
        let person = Person(firstName: "Jestin", lastName: "Dorius", age: 23)
        XCTAssertEqual(person.fullName, "Jestin Dorius")
    }
    
    func testFirstNameCap() {
        let person = Person(firstName: "jestin", lastName: "Dorius", age: 23)
        XCTAssertEqual(person.capFirstName(), "Jestin")
    }
    
    func testIntro() {
        let person = Person(firstName: "Jestin", lastName: "Dorius", age: 23)
        XCTAssertEqual(person.intro, "Hello, my name is Jestin Dorius, and I am 23 years old!")
    }
    
    func testPersonAge() {
        let person = Person(firstName: "Jestin", lastName: "Dorius", age: 23)
        XCTAssertEqual(person.ageGet(), 23)
    }
    
    func testAgeNotZero() {
        let person = Person(firstName: "Jestin", lastName: "Dorius", age: 23)
        XCTAssertGreaterThan(person.age, 0)
    }
    
    func testPersonID() {
        let person = Person(firstName: "Jestin", lastName: "Dorius", age: 23)
        XCTAssertNotNil(person.id)
    }
    
    func testPersonImage() {
        let person = Person(firstName: "Jestin", lastName: "Dorius", age: 23)
        XCTAssertNotNil(person.image)
    }
}
