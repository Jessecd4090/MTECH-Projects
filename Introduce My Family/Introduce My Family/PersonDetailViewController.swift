//
//  PersonDetailViewController.swift
//  Introduce My Family
//
//  Created by Jestin Dorius on 2/14/25.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet var personImageView: UIImageView!
    
    @IBOutlet var ageNumber: UILabel!
    
    @IBOutlet var occupationLabel: UILabel!
    
    @IBOutlet var hobbyLabel: UILabel!
    var hobbies: String?
    var occupation: String?
    var selectedImageName: String?
    //these two are to enable me to put the different photos in the imageView
    var personImage: UIImage?
    var ageNum: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        personImageView.image = personImage
        ageNumber.text = ageNum
        occupationLabel.text = occupation
        hobbyLabel.text = hobbies
        
    }
   
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//        if segue.identifier == "dadTapped"
//        personImageView.image =
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
