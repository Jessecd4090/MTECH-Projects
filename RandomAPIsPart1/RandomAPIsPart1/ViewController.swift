//
//  ViewController.swift
//  RandomAPIsPart1
//
//  Created by Jestin Dorius on 4/24/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getDogButtonTapped(_ sender: Any) {
        Task {
            let dog = await DogNetworkController.getDogFromAPI()
            print(dog)
        }
    }
    
}

