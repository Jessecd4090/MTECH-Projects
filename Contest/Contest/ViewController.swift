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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        if emailTextfield.state.isEmpty {
            var buttonBackground: UIView = submitButton
            UIView.animate(withDuration: 4, animations: {
                let transform = CGAffineTransform(scaleX: 3.0, y: 2.0)
                buttonBackground.transform = transform
            })
        } else {
            performSegue(withIdentifier: "submitTapped", sender: sender)
        }
    }
    
}

