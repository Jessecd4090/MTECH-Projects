//
//  ViewController.swift
//  Hello
//
//  Created by Jestin Dorius on 1/27/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var randomColorButton: UIButton!
    
    @IBOutlet var opacitySlider: UISlider!
    
    @IBOutlet var showControlswitch: UISwitch!
    
    let colors: [UIColor] = [.magenta, .systemMint, .lightGray, .black, .purple, .systemCyan, .systemRed]
    
    @IBOutlet var controlLabel: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var textLabel: UILabel!
    
    @IBOutlet var screenTapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let randomColors = colors.randomElement()
        self.view.backgroundColor = randomColors
        if view.backgroundColor == .black {
            textLabel.textColor = .white
            controlLabel.textColor = .white
        } else {
            textLabel.textColor = .black
            controlLabel.textColor = .black
        }
        // I could do view.backgroundColor = randomColors as well, self is not needed here
    }
    @IBAction func opacitySliderValueChanged(_ sender: UISlider) {
        self.view.alpha = CGFloat(sender.value)
        // alpha refers to the opacity of the view, it is of type CGFloat so thats why it must be cast that way
    }
    
    @IBAction func showControlSwitchToggled(_ sender: UISwitch) {
        
        self.randomColorButton.isHidden = !sender.isOn
        self.opacitySlider.isHidden = !sender.isOn
        self.textField.isHidden = !sender.isOn
        self.screenTapGesture.isEnabled = sender.isOn
        if sender.isOn {
            controlLabel.text = "Hide Controls"
        } else {
            controlLabel.text = "Show Controls"
        }
    }
    
    @IBAction func textFieldDidFinish(_ sender: UITextField) {
        self.textLabel.text = sender.text
        // this line below resets the textfield to show the placeholder text after some text has been entered by user
        sender.text = nil
    }
    
    @IBAction func didRecognizeTapGesture(_ sender: UITapGestureRecognizer) {
        let randomColors = colors.randomElement()
        self.view.backgroundColor = randomColors
        if view.backgroundColor == .black {
            textLabel.textColor = .white
            controlLabel.textColor = .white
        } else {
            textLabel.textColor = .black
            controlLabel.textColor = .black
        }
    }
}

