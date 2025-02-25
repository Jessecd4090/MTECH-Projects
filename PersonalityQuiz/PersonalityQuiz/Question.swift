//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Jestin Dorius on 2/18/25.
//

import Foundation

struct Question {
    var text: String?
    var type: responseType
    var answer: [Answers]
}
enum responseType {
    case single, multiple, range
}

struct Answers {
    var text: String
    var type: GamerType
    
}

enum GamerType: String {
    case playstation = "playstation.logo", xbox = "xbox.logo", ninSwitch = "formfitting.gamecontroller.fill", pc = "laptopcomputer"
    
    var definition: String {
        switch self {
        case .playstation:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .xbox:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .ninSwitch:
            return "You love everything that's soft and sweet. You seek the cute and wholesome things in life."
        case .pc:
            return "You are wise beyond your years, and you focus on the details. Willing to compromise convenience to achieve your goals."
        }
    }
}
