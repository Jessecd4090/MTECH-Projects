//
//  ViewController.swift
//  TextValidation
//
//  Created by Jestin Dorius on 2/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var errorMessageLabel: UILabel!
    @IBOutlet var loginSuccessLabel: UILabel!
    
    @IBOutlet var submitButton: UIButton!
    
    let specialCharacters = ",.!@#$%^&*<>?+=-"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        loginSuccessLabel.layer.cornerRadius = 10
        loginSuccessLabel.layer.masksToBounds = true
        errorMessageLabel.layer.cornerRadius = 10
        errorMessageLabel.layer.masksToBounds = true
    }
    
    func updateUI() {
        errorMessageLabel.isHidden = true
        loginSuccessLabel.isHidden = true
    }
    
    @IBAction func submitButtontapped(_ sender: Any) {
        guard let passwordTextFieldText = passwordTextField.text, let usernameTextFieldText = usernameTextField.text else { return }
        
        if passwordTextFieldText.count < 8 {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = "ERROR!!: The password length needs to be more than 8 characters long."
            loginSuccessLabel.isHidden = true
            return
        }
        // have a couple questions
        if !passwordTextFieldText.contains(where: { specialCharacters.contains($0) }) {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = "ERROR!!: The password must contain a special character."
            loginSuccessLabel.isHidden = true
            return
        }
        
        loginSuccessLabel.isHidden = false
        loginSuccessLabel.text = "Awesome, your password contains the correct elements needed for security purposes!"
        errorMessageLabel.isHidden = true
    }
    
    
}

