//
//  PaymentProcessor.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 4/17/25.
//

//MARK: Dependecy
// Example 1: ValidationService protocol
protocol ValidationService {
    func validate(card: CreditCard) -> Bool
}

class PaymentProcessor {
    private let validator: ValidationService
    
    init(validator: ValidationService) {
        self.validator = validator
    }
}
