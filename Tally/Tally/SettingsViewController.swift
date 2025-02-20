//
//  SettingsViewController.swift
//  Tally
//
//  Created by Jestin Dorius on 2/19/25.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet var sliderValueLabel: UILabel!
    var intervalValue = 0
    
    @IBOutlet var intervalSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sliderValueLabel.text = "Interval Value: " + String(intervalValue)
    }


    @IBAction func intervalSliderValueChanged(_ sender: UISlider) {
        let roundedValue = intervalSlider.value.rounded()
        intervalValue = Int(roundedValue)
        sliderValueLabel.text = "Interval Value: " + String(intervalValue)
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        intervalValue = 0
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? CounterViewController {
            destinationVC.counterInterval = intervalValue
        }
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
