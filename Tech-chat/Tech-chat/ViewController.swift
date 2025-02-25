//
//  ViewController.swift
//  Tech-chat
//
//  Created by Jestin Dorius on 2/24/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        userImageView.layer.masksToBounds = true
    }


}

