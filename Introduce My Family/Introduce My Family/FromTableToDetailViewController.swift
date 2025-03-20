//
//  FromTableToDetailViewController.swift
//  Introduce My Family
//
//  Created by Jestin Dorius on 3/19/25.
//

import UIKit

class FromTableToDetailViewController: UIViewController {
    
    
    var member: Member?
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
 
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var starSignLabel: UILabel!
    
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var hobbiesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        personImageView.image = member?.image
        personNameLabel.text = member?.name
        ageLabel.text = member?.age
        starSignLabel.text = member?.starSign
        occupationLabel.text = member?.occupation
        hobbiesLabel.text = member?.hobbies
        
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
