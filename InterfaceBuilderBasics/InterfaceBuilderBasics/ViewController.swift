//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Jestin Dorius on 1/23/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeLabelTitle(_ sender: Any) {
        mainLabel.text = "This app rocks!"
    }
    
}

