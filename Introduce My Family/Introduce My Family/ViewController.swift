//
//  ViewController.swift
//  Introduce My Family
//
//  Created by Jestin Dorius on 2/14/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dadButton: UIButton!
    
    @IBOutlet var momButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! PersonDetailViewController
        if let button = sender as? UIButton {
            switch button.title(for: .normal) {
            case "Dad":
                segue.destination.navigationItem.title = "Jestin W. Dorius"
                destinationVC.ageNum = "48"
                if segue.identifier == "dadTapped" {
                    destinationVC.personImage = UIImage(named: "Jestin")
                }
            case "Mom":
                segue.destination.navigationItem.title = "Heather Dorius"
                destinationVC.ageNumber.text = "48"
            case "Older Sister":
                segue.destination.navigationItem.title = "Emmalee Dorius"
            case "Older Brother":
                segue.destination.navigationItem.title = "Cody Dorius"
            case "Me":
                segue.destination.navigationItem.title = "Jestin C. Dorius"
            case "Younger Brother":
                segue.destination.navigationItem.title = "Caleb N. Dorius"
                
            default: break
            }
        }
//        if segue.identifier == "dadTapped" {
//            segue.destination.navigationItem.title = "Jestin"
//            destinationVC.personImageView = "Jestin"
//        } else if segue.identifier == "momTapped" {
//            segue.destination.navigationItem.title = "Heather"
//        }
    }
}

