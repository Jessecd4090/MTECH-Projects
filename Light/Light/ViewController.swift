//
//  ViewController.swift
//  Light
//
//  Created by Jestin Dorius on 1/22/25.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true
   // @IBOutlet var lightButton: UIButton!
    @IBOutlet var lightButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    fileprivate func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
        
//        if lightOn {
//            view.backgroundColor = .white
//            //lightButton.setTitle("Off", for: .normal)
//        } else {
//            view.backgroundColor = .black
//            //lightButton.setTitle("On", for: .normal)
//        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    
}

