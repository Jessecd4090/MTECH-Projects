//
//  ViewController.swift
//  Two Buttons
//
//  Created by Jestin Dorius on 1/27/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setTextButtonPressed(_ sender: Any) {
        Label.text = textField.text
        if textField.text == "" {
            Label.text = "ERROR: No text submitted!"
        }
    }
    @IBAction func clearTextButtonPressed(_ sender: Any) {
        textField.text = ""
        Label.text = ""
    }
    
}

