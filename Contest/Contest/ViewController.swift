//
//  ViewController.swift
//  Contest
//
//  Created by Jestin Dorius on 4/18/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var emailStack: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailStack.layer.cornerRadius = 20
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if emailTextfield.text?.isEmpty ?? true {
            print("textfield empty?")
            let buttonBackground: UIView = submitButton
            let emailView: UIView = emailStack
            UIView.animate(withDuration: 0.2, animations: {
                let translate = CGAffineTransform(translationX: 10, y: 0)
                let scale = CGAffineTransform(scaleX: 2.0, y: 1)
                buttonBackground.transform = translate
                emailView.transform = scale
                emailView.backgroundColor = .red
            }) { (_) in
                UIView.animate(withDuration: 0.1) {
                    buttonBackground.transform = CGAffineTransform.identity
                    emailView.transform = CGAffineTransform.identity
                    emailView.backgroundColor = .systemGray
                }
            }
            return
        } else {
            print("textfield not empty")
            performSegue(withIdentifier: "submitTapped", sender: sender)
        }
        return
    }
    
}

