//
//  ScoreboardTableViewController.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/25/25.
//

import UIKit

class ScoreboardTableViewController: UITableViewController {

    
    var players: [Player] = [
        Player(userImage: UIImage(systemName: "person.circle.fill")!,
               name: "Player 1",
               currentScore: "5"),
        Player(userImage: UIImage(systemName: "person.circle.fill")!,
               name: "Player 2",
               currentScore: "6"),
        Player(userImage: UIImage(systemName: "person.circle.fill")!,
               name: "Player 3",
               currentScore: "6"),
        Player(userImage: UIImage(systemName: "person.circle.fill")!,
               name: "Player 4",
               currentScore: "6")
    ]
    {
            didSet {
                tableView.reloadData()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        players.sort {
            guard let score1 = Int($0.currentScore),
                  let score2 = Int($1.currentScore) else {
                return false
            }
            return score1 > score2
        }
    }

    // MARK: - Table DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        let movedPlayer = players.remove(at: fromIndexPath.row)
//        players.insert(movedPlayer, at: to.row)
//    }
    
    
    //MARK: IBActions
    @IBAction func playerScoreStepperChanged(_ sender: UIStepper) {
        let rowIndex = sender.tag
        
        // Update the player's score
        players[rowIndex].currentScore = String(Int(sender.value))
        
        // Sort the players array by score (numeric comparison)
        players.sort {
            guard let score1 = Int($0.currentScore),
                  let score2 = Int($1.currentScore) else { return false }
            return score1 > score2
        }
        
        // Reload the entire table to reflect the new order
        tableView.reloadData()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? AddEditViewController,
        let cell = sender as? PlayerTableViewCell else { return }
        if segue.identifier == "cellSelected" {
            destinationVC.navigationItem.title = "Edit Player"
        }
        destinationVC.playerName = cell.playerNameLabel.text!
        destinationVC.playerCurrentScore = cell.playerScoreCountLabel.text!
    }
    
    @IBAction func unwindToScoreboard(_ unwindSegue: UIStoryboardSegue) {
        guard let sourceVC = unwindSegue.source as? AddEditViewController,
              let destinationVC = unwindSegue.destination as? ScoreboardTableViewController,
              let sourceVCPlayer = sourceVC.player else { return }
        
        
        let playerNameExists = players.contains { $0.name == sourceVCPlayer.name }
        
        // Only append if the player name is unique
        if !playerNameExists {
            players.append(sourceVCPlayer)
            // Sort the players array by score (numeric comparison)
            players.sort {
                guard let score1 = Int($0.currentScore),
                      let score2 = Int($1.currentScore) else {
                    return false
                }
                return score1 > score2
            }
        }
        // Reload the entire table to reflect the new order
        destinationVC.tableView.reloadData()
    }
}
