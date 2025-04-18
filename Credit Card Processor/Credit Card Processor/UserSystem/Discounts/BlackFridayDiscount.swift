//
//  BlackFridayDiscount.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 4/17/25.
//

class BlackFridayDiscount: Discount {
    func apply(to amount: Double) -> Double { amount * 0.7 }
}
