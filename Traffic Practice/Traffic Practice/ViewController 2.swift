//
//  ViewController.swift
//  Traffic Practice
//
//  Created by Jestin Dorius on 2/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func myUnwind(seque: UIStoryboardSegue) {
        
    }
    
    @IBAction func didEndEditing(_ sender: Any) {
        self.performSegue(withIdentifier: "yellow", sender: textField)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "yellow" {
            segue.destination.navigationItem.title = textField.text
        }
        
    }
    
}
