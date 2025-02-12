//
//  ViewController.swift
//  Calculator
//
//  Created by Jestin Dorius on 1/28/25.
//

import UIKit

class ViewController: UIViewController {
    
    var resultLabelDefault = "0"
    let operators = ["+", "-", "x", "÷"]
    // Label outlet
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var plusMinusbutton: UIButton!
    
    @IBOutlet var percentageButton: UIButton!
    
    @IBOutlet var divisionButton: UIButton!
    
    @IBOutlet var multiplyButton: UIButton!
    
    @IBOutlet var minusButton: UIButton!
    
    @IBOutlet var plusButton: UIButton!
    
    @IBOutlet var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Extra functions below
    
    //    func createNumbersForEquation(number1: String, number2: String) -> [String: String]{
    //        if number1 != "0" {
    //            let num1 = resultLabel.text
    //            let num2 = resultLabel.text
    //            let twoNumbers = [num1, num2]
    //        } else {
    //
    //        }
    //
    //    }
    // negative check function
    
    func negativeCheck(number: String) {
        if var text = resultLabel.text, !text.isEmpty {
            if text.hasPrefix("-") {
                text.removeFirst()
            } else if resultLabel.text == "0" {
            } else {
                text = "-" + text
            }
            resultLabel.text = text
        }
    }
    func containsDecimal(number: String) {
        guard let numberText = resultLabel.text else { return }
        if numberText.contains(".") {
        } else {
            let firstChar = String(numberText.prefix(1))
            let remaining = String(numberText.dropFirst())
            resultLabel.text = firstChar + "." + remaining
        }
    }
    /*
     Button actions here below
     */
    
    // condition ? expression1 : expression2
    
    //This function updates the clear/AC button to be those titles
    func updateToClear() {
        if resultLabel.text == "0" {
            clearButton.setTitle("AC", for: .normal)
        } else if resultLabel.text != nil {
            clearButton.setTitle("Clear", for: .normal)
            resultLabel.text?.removeLast()
            
        }
        if resultLabel.text?.count == 0 {
            resultLabel.text = resultLabelDefault
            clearButton.setTitle("AC", for: .normal)
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        updateToClear()
    }
    
    
    @IBAction func plusMinButtonTapped(_ sender: Any) {
        negativeCheck(number: resultLabel.text!)
    }
    
    @IBAction func percentageButtonTapped(_ sender: Any) {
    }
    
    @IBAction func divisionButtonTapped(_ sender: Any) {
    }
    
    @IBAction func multiplyButtonTapped(_ sender: Any) {
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    }
    
    @IBAction func equalButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func decimalButtonTapped(_ sender: Any) {
        containsDecimal(number: resultLabel.text ?? "")
    }
    
    //action for all number buttons as they are typed
    @IBAction func numberTyped(_ sender: Any) {
        guard let senderButton = sender as? UIButton else { return }
        var currentText = resultLabel.text
        if currentText == resultLabelDefault {
            currentText = senderButton.title(for: .normal)
        } else {
            currentText?.append(senderButton.title(for: .normal) ?? "")
        }
        resultLabel.text = currentText
    }
}
