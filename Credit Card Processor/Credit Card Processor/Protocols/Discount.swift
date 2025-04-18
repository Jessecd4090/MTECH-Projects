//
//  Discount.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 4/17/25.
//

//MARK: Open and closed
protocol Discount {
    func apply(to amount: Double) -> Double
}

protocol UserDiscount {
    func discount() -> Double
}


