//
//  ViewController.swift
//  AppEventCount
//
//  Created by Jestin Dorius on 3/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    var willConnectCount = 0
    
    @IBOutlet var didFinishLaunchingLabel: UILabel!
    @IBOutlet var configurationForConnecting: UILabel!
    @IBOutlet var willConnectTo: UILabel!
    @IBOutlet var sceneDidBecomeActive: UILabel!
    @IBOutlet var sceneWillResignActive: UILabel!
    @IBOutlet var sceneWillEnterForeground: UILabel!
    @IBOutlet var sceneDidEnterBackground: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(appDelegate.launchCount) time(s)."
        configurationForConnecting.text = "The scene has launched \(appDelegate.launchCount) time(s). "
        willConnectTo.text = "The app has connected \(willConnectCount) time(s)."
        sceneDidBecomeActive.text = "The app's scene did become active \(willConnectCount) time(s)."
        sceneWillResignActive.text = "The app's scene will resign active \(willConnectCount) time(s)."
        sceneWillEnterForeground.text = "The app's scene will enter the foreground \(willConnectCount) time(s)."
        sceneDidEnterBackground.text = "The app's scene did enter the background \(willConnectCount) time(s)."
    }

}

