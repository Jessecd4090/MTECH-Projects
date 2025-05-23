//
//  GamesTableViewController.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/31/25.
//

import UIKit

class GamesTableViewController: UITableViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as? GameTableViewCell else { return UITableViewCell() }

        let game = games[indexPath.row]
        // Configure the cell...
        cell.gameTitle.text = game.title
        cell.gameImage.image = game.gameImage
        cell.currentWinnerLabel.text = game.currentWinner.name
        // checking the games sorting style and sorting accordingly
//        if game.highestSort {
//            players.sort {
//                guard let score1 = Int($0.currentScore),
//                      let score2 = Int($1.currentScore) else {
//                    return false
//                }
//                return score1 > score2
//            }
//            let currentFirst = game.players.first
//            cell.currentWinnerLabel.text = currentFirst?.name
//        } else {
//            players.sort {
//                guard let score1 = Int($0.currentScore),
//                      let score2 = Int($1.currentScore) else {
//                    return false
//                }
//                return score1 < score2
//            }
//            let currentFirst = game.players.first
//            cell.currentWinnerLabel.text = currentFirst?.name
//        }
        return cell
    }


    
    // MARK: - Navigation

    @IBSegueAction func showAddGame(_ coder: NSCoder) -> NewGameViewController? {
        return NewGameViewController(game: nil, coder: coder)
    }
    
    
    //MARK: Game Cell Tap, Game.players
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let editDestinationVC = segue.destination as? ScoreboardTableViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
        
        
        if segue.identifier == "editGame" {
            editDestinationVC.game = games[indexPath.row]
            editDestinationVC.navigationItem.title = games[indexPath.row].title
        }
    }
    
    //MARK: Handle Score Updates
    @IBAction func unwindToGamesTableFromScore(_ unwindSegue: UIStoryboardSegue) {
        
        guard let sourceVC = unwindSegue.source as? ScoreboardTableViewController,
              unwindSegue.identifier == "scoreToGame",
        let sourceVCGame = sourceVC.game else { return }
        
        //need to find the index of original game
        if let index = games.firstIndex(where: { $0.title == sourceVCGame.title }) {
            games[index] = sourceVCGame
//            if games[index].highestSort == true {
//                games[index].currentWinner = games[index].players.first!
//            } else {
//                games[index].currentWinner = games[index].players.last!
//            }
        }
        tableView.reloadData()
    }
    
    //MARK: Save New Game
    @IBAction func unwindToGamesFromNew(_ unwindSegue: UIStoryboardSegue) {
        let sourceVC = unwindSegue.source as? NewGameViewController
        // Use data from the view controller which initiated the unwind segue
        print(sourceVC?.game)
        guard let sourceVCGame = sourceVC?.game else { return }
        print(sourceVCGame)
        games += [sourceVCGame]
        print(sourceVCGame)
        tableView.reloadData()
    }
}
