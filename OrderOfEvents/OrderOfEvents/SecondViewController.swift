//
//  SecondViewController.swift
//  OrderOfEvents
//
//  Created by Jestin Dorius on 2/7/25.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var eventNumber = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        addEvent(from: "viewDidLoad")
        // Do any additional setup after loading the view.
    }
        func addEvent(from: String) {
            if let existingText = label.text {
                label.text = "\(existingText)\n Event number \(eventNumber) was \(from)"
                eventNumber += 1
            }
        }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addEvent(from: "viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addEvent(from: "viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addEvent(from: "viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addEvent(from: "viewDidDisappear")
    }
}
