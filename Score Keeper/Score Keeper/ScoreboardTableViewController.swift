//
//  ScoreboardTableViewController.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/25/25.
//

import UIKit

class ScoreboardTableViewController: UITableViewController {

    
    var players: [Player] = [] {
            didSet {
                // Sort players whenever the array changes
                players.sort { $0.currentScore > $1.currentScore }
                tableView.reloadData()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerTableViewCell else { return UITableViewCell() }
        
        let player = players[indexPath.row]

        // Configure the cell...
        cell.playerImageView.image = player.userImage
        cell.playerNameLabel.text = player.name
        cell.playerScoreCountLabel.text = "\(player.currentScore)"

        cell.playerScoreStepper.value = Double(player.currentScore)!
        cell.playerScoreStepper.tag = indexPath.row
        cell.playerScoreStepper.addTarget(self, action: #selector(playerScoreStepperChanged(_:)), for: .valueChanged)
        
        return cell
    }
    
    
    @IBAction func playerScoreStepperChanged(_ sender: UIStepper) {
        let rowIndex = sender.tag
        
        players[rowIndex].currentScore = String(Int(sender.value))
        
        let indexPath = IndexPath(row: rowIndex, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? AddEditViewController,
        let cell = sender as? PlayerTableViewCell else { return }
        if segue.identifier == "cellSelected" {
            destinationVC.navigationItem.title = "Edit Player"
        }
        destinationVC.playerName = cell.playerNameLabel.text!
        destinationVC.playerCurrentScore = cell.playerScoreCountLabel.text!
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedPlayer = players.remove(at: fromIndexPath.row)
        players.insert(movedPlayer, at: to.row)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
