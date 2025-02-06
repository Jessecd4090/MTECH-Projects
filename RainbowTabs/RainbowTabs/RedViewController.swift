//
//  ViewController.swift
//  RainbowTabs
//
//  Created by Jestin Dorius on 2/5/25.
//

import UIKit

class RedViewController: UIViewController {

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarItem.badgeValue = nil
    }
    
    override func viewDidLoad() {
        tabBarItem.badgeValue = "!"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  


}

