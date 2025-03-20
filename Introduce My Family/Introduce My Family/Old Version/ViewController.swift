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
        if segue.identifier == "dadTapped" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.navigationItem.title = "Jestin W. Dorius"
                destinationVC.personImage = UIImage.jestin
                destinationVC.ageNum = "48"
                destinationVC.starSign = "Taurus"
                destinationVC.occupation = "HVAC Certified, previously owned and operated solo business JWD Electric, currently working for Utah State"
                destinationVC.hobbies = "Loves fixing things and learning how to fix new things in the process, lover of old rock, good comedies and being able to serve others in any way he can find."
            }
        }
        if segue.identifier == "momTapped" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.navigationItem.title = "Heather L. Dorius"
                destinationVC.ageNum = "48"
                destinationVC.personImage = UIImage.heather
                destinationVC.starSign = "Aries"
                destinationVC.occupation = "Bachelors degree in Humanities, loves to serve the elder community and ensure that they are properly taken care of"
                destinationVC.hobbies = "Loves to serve others, read good romance books, do puzzles or play games with others."
            }
        }
        if segue.identifier == "sisterTapped" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.navigationItem.title = "Emmalee A. Dorius"
                destinationVC.ageNum = "27"
                destinationVC.personImage = UIImage.emma
                destinationVC.starSign = "Scorpio"
                destinationVC.occupation = "Certification from hair school, loves to serve customers by finding the service or product they require. Currently employed at Starry Night smoke and vape"
                destinationVC.hobbies = "Loves to spend time with boyfriend, play games, go for drives, listen to good music and have a good time, presently playing and loving Cult of the Lamb."
            }
        }
        if segue.identifier == "olderBrotherTapped" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.navigationItem.title = "W. Cody Dorius"
                destinationVC.ageNum = "26"
                destinationVC.personImage = UIImage.cody
                destinationVC.starSign = "Cancer"
                destinationVC.occupation = "Degree from massage therapy school, currently working as a massage therapist"
                destinationVC.hobbies = "Loves to spend time playing video games, presently playing No Man's Sky, spending time with boyfriend, and spending time with family whenever possible."
            }
        }
        if segue.identifier == "meTapped" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.navigationItem.title = "Jestin C Dorius"
                destinationVC.personImage = UIImage.me
                destinationVC.ageNum = "23"
                destinationVC.starSign = "Capricorn"
                destinationVC.occupation = "Currently in school for Mobile Development for iOS devices, and working at Mister Car Wash for the moment. Future plans include creating and maintaining iOS apps on the appstore."
                destinationVC.hobbies = "Loves to spend time playing video games, spend time learning new things, go for drives while listening to music."
            }
        }
        if segue.identifier == "youngBrotherTapped" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.navigationItem.title = "Caleb N. Dorius"
                destinationVC.personImage = UIImage.caleb
                destinationVC.ageNum = "20"
                destinationVC.starSign = "Aries"
                destinationVC.occupation = "Currently working for Cafe Zupas, in a self made band, learning new skills to better reach their future audience."
                destinationVC.hobbies = "Loves to spend time learning how different aspects of the music industry work, and how he can become part of it."
            }
        }
    }
}
