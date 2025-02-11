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
    
    // function to check if the label is empty before assigning a number to it
    func numCheck(number: String) {
        if resultLabel.text == resultLabelDefault {
            if resultLabel.text != nil {
                resultLabel.text = number
            }
        } else {
            resultLabel.text?.append(number)
        }
    }
    
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
        let numberText = resultLabel.text
        if !numberText!.isEmpty {
            let firstChar = String(numberText!.prefix(0))
            let remaining = String(numberText!.dropFirst())
            resultLabel.text = firstChar + "." + remaining
        } else if (numberText?.count == 1) {
            resultLabel.text?.append(".")
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
    
    func createTwoNums() {
        
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        updateToClear()
    }
    
    
    @IBAction func plusMinButtonTapped(_ sender: Any) {
        negativeCheck(number: resultLabel.text!)
    }
    
    @IBAction func percentageButtonTapped(_ sender: Any) {
        if percentageButton.isTouchInside {
            
        }
    }
    
    @IBAction func divisionButtonTapped(_ sender: Any) {
        numCheck(number: "÷")
        if ((resultLabel.text?.contains("÷")) != nil) {
            divisionButton.isEnabled = false
        }
    }
    
    @IBAction func multiplyButtonTapped(_ sender: Any) {
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        numCheck(number: "+")
        if resultLabel.text?.contains("+") != nil {
            plusButton.isEnabled = false
        }
    }
    
    @IBAction func equalButtonTapped(_ sender: Any) {
       
    }
    
    @IBAction func decimalButtonTapped(_ sender: Any) {
//        if var text = resultLabel.text?.contains(".") {
//        } else {
//            resultLabel.text?
//        }
        
    }
    
    /* Number button actions are here below
     */
// This was the initial draft of checking the label text, after copying and pasting multiple times, I decided a function would work better
//        if resultLabel.text == resultLabelDefault {
//            resultLabel.text = "7"
//        } else {
//            resultLabel.text?.append("7")
//        }
//    }
    
    @IBAction func num1ButtonTapped(_ sender: Any) {
        numCheck(number: "1")
        clearButton.setTitle("Clear", for: .normal)
    }
    
    @IBAction func num2ButtonTapped(_ sender: Any) {
        numCheck(number: "2")
        clearButton.setTitle("Clear", for: .normal)
    }
    
    @IBAction func num3ButtonTapped(_ sender: Any) {
        numCheck(number: "3")
        clearButton.setTitle("Clear", for: .normal)
    }
    
    @IBAction func num4ButtonTapped(_ sender: Any) {
        numCheck(number: "4")
        clearButton.setTitle("Clear", for: .normal)
    }
    
    @IBAction func num5ButtonTapped(_ sender: Any) {
        numCheck(number: "5")
        clearButton.setTitle("Clear", for: .normal)
    }
    
    @IBAction func num6ButtonTapped(_ sender: Any) {
        numCheck(number: "6")
        clearButton.setTitle("Clear", for: .normal)
    }
    
    @IBAction func num7ButtonTapped(_ sender: Any) {
        numCheck(number: "7")
        clearButton.setTitle("Clear", for: .normal)
    }
    
    @IBAction func num8ButtonTapped(_ sender: Any) {
        numCheck(number: "8")
        clearButton.setTitle("Clear", for: .normal)
    }
    
    @IBAction func num9ButtonTapped(_ sender: Any) {
        numCheck(number: "9")
        clearButton.setTitle("Clear", for: .normal)
    }
    
    @IBAction func num0ButtonTapped(_ sender: Any) {
        if resultLabel.text == "0" {
        } else {
            resultLabel.text?.append("0")
            clearButton.setTitle("Clear", for: .normal)
        }
    }
}
