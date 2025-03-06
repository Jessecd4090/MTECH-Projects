//
//  ViewController.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 3/4/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    class CreditCard {
        var cardNumber: Int
        var cardHolderName: String
        var expiration: Int
        var cvv: Int
        
        init(cardNumber: Int, cardHolderName: String, expiration: Int, cvv: Int) {
            self.cardNumber = cardNumber
            self.cardHolderName = cardHolderName
            self.expiration = expiration
            self.cvv = cvv
        }
    }
    protocol CardNumCheck {
        func creditCardCheck()
    }
    protocol CardIsValid {
        func validCardNumber()
       
    }
    
    //this checks to be sure that there is a card on file
    class cardOnFile: CardIsValid, CardNumCheck {
        func validCardNumber() {
            print("The card is a valid credit card")
        }
        func creditCardCheck() {
            print("Credit card is on file")
        }
    }
    
    //This will be used to process the card
    class creditCardProcess {
        func processCreditCard() {
            print("payment was processed")
        }
    }
    
    
    
    

}

