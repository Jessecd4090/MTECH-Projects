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
//        let destinationVC = segue.destination as! PersonDetailViewController
        if segue.identifier == "dadTapped" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.navigationItem.title = "Jestin W. Dorius"
                destinationVC.ageNum = "48"
                destinationVC.personImage = UIImage.jestin
                destinationVC.occupation = "HVAC Certified, previously owned and operated solo business JWD Electric, currently working for Utah State"
                destinationVC.hobbies = "Loves fixing things and learning how to fix new things in the process, lover of old rock, good comedies and being able to serve others in any way he can find."
            }
        }
        if segue.identifier == "momTapped" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.navigationItem.title = "Heather L. Dorius"
                destinationVC.ageNum = "48"
                destinationVC.personImage = UIImage.heather
            }
        }
        if segue.identifier == "sisterTapped" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.navigationItem.title = "Emmalee A. Dorius"
                destinationVC.ageNum = "27"
                destinationVC.personImage = UIImage.emma
            }
        }
//            case "Mom":
//                segue.destination.navigationItem.title = "Heather Dorius"
//                destinationVC.ageNumber.text = "48"
//            case "Older Sister":
//                segue.destination.navigationItem.title = "Emmalee Dorius"
//            case "Older Brother":
//                segue.destination.navigationItem.title = "Cody Dorius"
//            case "Me":
//                segue.destination.navigationItem.title = "Jestin C. Dorius"
//            case "Younger Brother":
//                segue.destination.navigationItem.title = "Caleb N. Dorius"
//                
//            default: break
            }
        }
//        if segue.identifier == "dadTapped" {
//            segue.destination.navigationItem.title = "Jestin"
//            destinationVC.personImageView = "Jestin"
//        } else if segue.identifier == "momTapped" {
//            segue.destination.navigationItem.title = "Heather"
//        }
    

