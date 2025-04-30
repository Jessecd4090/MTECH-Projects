//
//  DogViewController.swift
//  RandomAPIsPart1
//
//  Created by Jestin Dorius on 4/24/25.
//

import UIKit

class DogViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    var dog: Dog?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            do {
                dog = await DogNetworkController.getDogFromAPI()
                guard let dogImage = dog?.image else { return }
                dogImageView.image = await DogNetworkController.getDogPic(url: dogImage)
            }
        }
    }

    @IBAction func getDogButtonTapped(_ sender: Any){
        Task {
            do {
                dog = await DogNetworkController.getDogFromAPI()
                guard let dogImage = dog?.image else { return }
                dogImageView.image = await DogNetworkController.getDogPic(url: dogImage)
                print(dog)
            }
            
        }
    }
    
}

