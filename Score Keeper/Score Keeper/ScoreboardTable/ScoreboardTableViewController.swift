//
//  ScoreboardTableViewController.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/25/25.
//

import UIKit

class ScoreboardTableViewController: UITableViewController, PlayerEditDelegate {
    
    var game: Game?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.title = "Games"
        tableView.reloadData()
    }

    //MARK: Delegate Function
    func didSavePlayer(_ player: Player) {
        print(player.currentScore)
        print(player.name)
        print(player.id)
        
        guard let game = game else { return }
        let playerIDExists = game.players.contains(where: { $0.id == player.id })
        //        guard let playerExists = game?.players.contains( where: { $0.name == player.name && $0.currentScore == player.currentScore } ) else { return }
        
        //changed to playerIDExists from playerExists
        if playerIDExists {
            if let index = game.players.firstIndex(where: { $0.id == player.id }) {
                self.game?.players[index] = player
            }
        } else {
            self.game?.players.append(player)
        }
        if game.highestSort == true {
            self.game?.sortPlayersHighToLow()
        } else {
            self.game?.sortPlayersLowToHigh()
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Table DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game?.players.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerTableViewCell, let game else { return UITableViewCell() }
        
        let player = game.players[indexPath.row]
        
        
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
        guard var game = game else { return }
//        let gameHighestSort = game.highestSort
//        let gameHighestWins = game.highestWins
        
        // Update the player's score
        game.players[rowIndex].currentScore = String(Int(sender.value))
        
        switch game.highestSort {
        case true:
            game.sortPlayersHighToLow()
        case false:
            game.sortPlayersLowToHigh()
        }
        switch (game.highestSort, game.highestWins) {
        case (true, true):
            game.sortPlayersHighToLow()
            game.currentWinner = game.players.first!
        case (false, true):
            game.sortPlayersLowToHigh()
            game.currentWinner = game.players.last!
        case (false, false):
            game.sortPlayersLowToHigh()
            game.currentWinner = game.players.first!
        case (true, false):
            game.sortPlayersHighToLow()
            game.currentWinner = game.players.last!
        }
        
        self.game = game
        
        
        tableView.reloadData()
        // Sort the players array by score (numeric comparison)
        //        if gameToEditHighestSort == true {
        //            gameToEdit?.sortPlayersHighToLow()
        //
        //        } else {
        //            gameToEdit?.sortPlayersLowToHigh()
        //            }
        //        if gameToEditHighestWins == true {
        //            self.gameToEdit?.currentWinner = (gameToEdit?.players.first)!
        //        }
        //        self.gameToEdit?.currentWinner = (gameToEdit?.players.last)!
        //
        //
        // Reload the entire table to reflect the new order
        //        gameToEdit?.currentWinner = (gameToEdit?.players.first)!
        
        
        print(game.currentWinner.currentScore)
    }
    
    
    // MARK: - Navigation
    
    
    
    //MARK: Edit Player Cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellSelected" {
            guard let addNewPlayerVC = segue.destination as? AddEditPlayerViewController,
                  let cell = sender as? PlayerTableViewCell,
                  let indexPath = tableView.indexPath(for: cell), game != nil else { return }
            addNewPlayerVC.navigationItem.title = "Edit Player"
            addNewPlayerVC.delegate  = self
            addNewPlayerVC.player = game?.players[indexPath.row]
            print(indexPath)
        }
        let addNewPlayerVC = segue.destination as? AddEditPlayerViewController
        addNewPlayerVC?.delegate = self
        
        // Reload the entire table to reflect the new order
        tableView.reloadData()
    }
}
