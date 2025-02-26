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
    case fox = "🦊", penguin = "🐧", hedgehog = "🦔", elephant = "🐘"
    
    var definition: String {
        switch self {
        case .fox:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .penguin:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .hedgehog:
            return "You love everything that's soft and sweet. You seek the cute and wholesome things in life."
        case .elephant:
            return "You are wise beyond your years, and you focus on the details. Willing to compromise convenience to achieve your goals."
        }
    }
}
