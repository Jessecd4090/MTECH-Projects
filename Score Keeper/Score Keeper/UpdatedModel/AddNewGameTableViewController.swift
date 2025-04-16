//
//  AddNewGameTableViewController.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/31/25.
//

import UIKit

//class AddNewGameTableViewController: UITableViewController, PlayerEditDelegate {
//    
//    
//    
//    @IBOutlet weak var gameTitleTextField: UITextField!
//    @IBOutlet weak var sortPlayerBySegControl: UISegmentedControl!
//    @IBOutlet weak var whoWinsSegControl: UISegmentedControl!
//    
//    var newPlayers: [Player] = []
//    var game: Game?
////    {
////        didSet {
////            guard game != nil else { return }
////        }
////    }
//    //MARK: Delegate Function
//    func didSavePlayer(_ player: Player) {
//        self.newPlayers += [player]
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
    
//    //MARK: IBActions
//    
//    
//    
//    
//    //MARK: Save New Game
//    @IBAction func saveButtonTapped(_ sender: Any) {
//        performSegue(withIdentifier: "saveNewGame", sender: sender)
//    }
//    
//    //MARK: AutoUpdate NavTitle
//    @IBAction func gameTitleChanged(_ sender: Any) {
//        navigationItem.title = gameTitleTextField.text
//    }
    
    // MARK: - Table view data source
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "saveNewGame" {
//            createNewGame()
//        }
//        if segue.identifier == "showAddEditPlayer" { // Use your actual segue identifier
//                let addEditPlayerVC = segue.destination as! AddEditPlayerViewController
//                addEditPlayerVC.delegate = self // Set delegate to self
//            }
//    }
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        if indexPath.section == 2 {
    //            guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerTableViewCell else { return UITableViewCell() }
    //
    //            let newPlayer = newPlayers[indexPath.row]
    //
    //            // Configure the cell...
    //            cell.playerNameLabel.text = newPlayer.name
    //            cell.playerImageView.image = newPlayer.userImage
    //            cell.playerScoreCountLabel.text = newPlayer.currentScore
    //
    //
    //            return cell
    //        }
    //        return super.tableView(tableView, cellForRowAt: indexPath)
    //    }
    
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        if section == 2 {
    //            return newPlayers?.count
    //        }
    //        return super.tableView(tableView, numberOfRowsInSection: section)
    //    }
    
    
    // MARK: - Navigation



