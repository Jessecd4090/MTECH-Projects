//
//  ScoreboardTableViewController.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/25/25.
//

import UIKit

class ScoreboardTableViewController: UITableViewController {

    var gameToEdit: Game?
    
    var gamePlayers: [Player] = []
    {
            didSet {
                tableView.reloadData()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if gameToEdit?.highestSort == true {
            sortPlayersHighToLow()
        }
    }

    
    // MARK: - Table DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameToEdit?.players.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerTableViewCell, let gameToEdit else { return UITableViewCell() }
        
        let player = gameToEdit.players[indexPath.row]
        
        
        // Configure the cell...
        cell.playerImageView.image = player.userImage
        cell.playerNameLabel.text = player.name
        cell.playerScoreCountLabel.text = "\(player.currentScore)"

        cell.playerScoreStepper.value = Double(player.currentScore)!
        cell.playerScoreStepper.tag = indexPath.row
        cell.playerScoreStepper.addTarget(self, action: #selector(playerScoreStepperChanged(_:)), for: .valueChanged)
        
        return cell
    }
    
    
    //MARK: IBActions
    @IBAction func playerScoreStepperChanged(_ sender: UIStepper) {
        let rowIndex = sender.tag
        
        // Update the player's score
        gameToEdit?.players[rowIndex].currentScore = String(Int(sender.value))
        
        
        // Sort the players array by score (numeric comparison)
        if gameToEdit?.highestSort == true {
            gameToEdit?.players.sort {
                guard let score1 = Int($0.currentScore),
                      let score2 = Int($1.currentScore) else { return false }
                return score1 > score2
            }
        } else {
            gameToEdit?.players.sort {
                guard let score1 = Int($0.currentScore),
                      let score2 = Int($1.currentScore) else {
                    return false }
                return score1 < score2
                }
            }
        // Reload the entire table to reflect the new order
//        gameToEdit?.currentWinner = (gameToEdit?.players.first)!
        tableView.reloadData()
    }
    
    
    // MARK: - Navigation
    
    
    
    //MARK: Edit Player Cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? AddEditPlayerViewController,
        let cell = sender as? PlayerTableViewCell else { return }
        if segue.identifier == "cellSelected" {
            destinationVC.navigationItem.title = "Edit Player"
        }
        destinationVC.playerName = cell.playerNameLabel.text!
        destinationVC.playerCurrentScore = cell.playerScoreCountLabel.text!
    }
    
    //MARK: Save Player or New
    @IBAction func unwindToScoreboard(_ unwindSegue: UIStoryboardSegue) {
        guard let sourceVC = unwindSegue.source as? AddEditPlayerViewController,
              let destinationVC = unwindSegue.destination as? ScoreboardTableViewController,
              let sourceVCPlayer = sourceVC.player, unwindSegue.identifier == "saveUnwind" else { return }
        
        let playerNameExists = players.contains { $0.name == sourceVCPlayer.name }
       
        // Only append if the player name is unique
        if !playerNameExists {
            gameToEdit?.players.append(sourceVCPlayer)
        }
        // Reload the entire table to reflect the new order
        destinationVC.tableView.reloadData()
    }
    
}
