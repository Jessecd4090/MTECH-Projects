//
//  FamilyMember.swift
//  Introduce My Family
//
//  Created by Jestin Dorius on 3/19/25.
//
import UIKit

struct Member {
    var name: String?
    var image: UIImage?
    var age: String?
    var starSign: String?
    var occupation: String?
    var occupationShort: String?
    var hobbies: String?
    
}

let members = [
    Member(
        name: "Jestin W. Dorius",
        image: .jestin,
        age: "48",
        starSign: "Taurus",
        occupation: "HVAC Certified, previously owned and operated solo business JWD Electric, currently working for Utah State",
        occupationShort: "HVAC Certified, previously owned and operated solo business JWD Electric",
        hobbies: "Loves fixing things and learning how to fix new things in the process, lover of old rock, good comedies and being able to serve others in any way he can find."),
    Member(
        name: "Heather L. Dorius",
        image: .heather,
        age: "48",
        starSign: "Aries",
        occupation: "Bachelors degree in Humanities, loves to serve the elder community and ensure that they are properly taken care of",
        occupationShort: "Bachelors degree in Humanities, loves to serve the elder community",
        hobbies: "Loves to serve others, read good romance books, do puzzles or play games with others."),
    Member(name: "Emmalee A. Dorius",
           image: .emma,
           age: "27",
           starSign: "Scorpio",
           occupation: "Certification from hair school, loves to serve customers by finding the service or product they require. Currently employed at Starry Night smoke and vape",
           occupationShort: "Certification from hair school, loves to serve customers",
           hobbies: "Loves to spend time with boyfriend, play games, go for drives, listen to good music and have a good time, presently playing and loving Cult of the Lamb."),
    Member(name: "W. Cody Dorius",
           image: .cody,
           age: "26",
           starSign: "Cancer",
           occupation: "Degree from massage therapy school, currently working as a massage therapist",
           occupationShort: "Degree from massage therapy school",
           hobbies: "Loves to spend time playing video games, presently playing No Man's Sky, spending time with boyfriend, and spending time with family whenever possible."),
    Member(name: "Jestin C. Dorius",
           image: .me,
           age: "23",
           starSign: "Capricorn",
           occupation: "Currently in school for Mobile Development for iOS devices, and working at Mister Car Wash for the moment. Future plans include creating and maintaining iOS apps on the appstore.",
           occupationShort: "Currently in school for Mobile Development for iOS devices",
           hobbies: "Loves to spend time playing video games, spend time learning new things, go for drives while listening to music."),
    Member(name: "Caleb N. Dorius",
           image: .caleb,
           age: "20",
           starSign: "Aries",
           occupation: "Currently working for Cafe Zupas, in a self made band, learning new skills to better reach their future audience.",
           occupationShort: "Currently working for Cafe Zupas",
           hobbies: "Loves to spend time learning how different aspects of the music industry work, and how he can become part of it.")
]
