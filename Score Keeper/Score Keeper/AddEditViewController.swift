//
//  ViewController.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/25/25.
//

import UIKit

class AddEditViewController: UIViewController {
    
    
    @IBOutlet weak var playerNameTextField: UITextField!
    var playerName: String = ""
    @IBOutlet weak var playerCurrentScoreTextField: UITextField!
    var playerCurrentScore: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerNameTextField.text = playerName
        playerCurrentScoreTextField.text = playerCurrentScore
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let playerNameFrom = playerNameTextField.text, let playerCurrentScoreFrom = playerCurrentScoreTextField.text else { return }
        let player = Player(userImage: UIImage(systemName: "person.circle.fill")!, name: playerNameFrom, currentScore: playerCurrentScoreFrom)
        
        players.append(player)
    }
    
}

