//
//  ViewController.swift
//  Login
//
//  Created by Jestin Dorius on 2/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var username: UITextField!
    
    @IBOutlet var forgotUsernamebutton: UIButton!
    
    @IBOutlet var forgotPasswordbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        if sender == forgotPasswordbutton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUsernamebutton {
                segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = username.text
        }
    }
    
    @IBAction func forgotUsernameButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: forgotUsernamebutton)
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: forgotPasswordbutton)
    }
    
}

