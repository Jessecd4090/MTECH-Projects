//
//  ViewController.swift
//  Tally
//
//  Created by Jestin Dorius on 2/19/25.
//

import UIKit

class CounterViewController: UIViewController {

    
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var sliderValueLabel: UILabel!
    
    @IBOutlet var counterLabel: UILabel!
    var counterLabelDefault = "0"
    var sliderLabelDefault = "Interval Value: 1"
    var counterLabelInt = 0
    var counterInterval = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetCounter()
    }

    @IBAction func counterButtonTapped(_ sender: Any) {
        counterLabelInt += counterInterval
        counterLabel.text = String(counterLabelInt)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundedValue = sender.value.rounded()
        sender.value = roundedValue
        sliderValueLabel.text = "Interval Value: " + String(roundedValue)
        counterInterval = Int(roundedValue)
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        resetCounter()
    }
    func resetCounter() {
        if counterLabel.text != counterLabelDefault || sliderValueLabel.text != sliderLabelDefault {
            counterLabel.text = counterLabelDefault
            sliderValueLabel.text = sliderLabelDefault
            slider.value = 1
            counterInterval = 1
            counterLabelInt = 0
        }
    }
}

