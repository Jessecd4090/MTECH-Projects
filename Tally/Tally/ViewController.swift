//
//  ViewController.swift
//  Tally
//
//  Created by Jestin Dorius on 2/19/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var sliderValueLabel: UILabel!
    
    @IBOutlet var counterLabel: UILabel!
    var counterLabelInt = 0
    var counterInterval = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = String(counterLabelInt)
        sliderValueLabel.text = String(slider.value)
    }

    @IBAction func counterButtonTapped(_ sender: Any) {
        counterLabelInt += counterInterval
        counterLabel.text = String(counterLabelInt)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundedValue = sender.value.rounded()
        sender.value = roundedValue
        sliderValueLabel.text = String(roundedValue)
        counterInterval = Int(roundedValue)
    }
    
}

