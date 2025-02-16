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
    
    var selectedImageName: String?
    //these two are to enable me to put the different photos in the imageView
    var personImage: UIImage?
    var ageNum: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        personImageView.image = personImage
        ageNumber.text = ageNum
    }
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == "dadTapped" {
            personImageView.image = UIImage.jestin
            ageNumber.text = "48"
        }
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
