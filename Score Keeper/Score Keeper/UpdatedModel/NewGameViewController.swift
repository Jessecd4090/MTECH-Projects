//
//  NewGameViewController.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 4/14/25.
//

import UIKit

class NewGameViewController: UIViewController, PlayerEditDelegate {

    
    @IBOutlet var gameTitleTextfield: UITextField!
    @IBOutlet var sortPlayerBySegControl: UISegmentedControl!
    @IBOutlet var whoWinsSegControl: UISegmentedControl!
    @IBOutlet var playersTableView: UITableView!
    
    var newPlayers: [Player] = []
    var game: Game? {
        didSet {
            print("game set?")
        }
    }
    
    init?(game: Game?, coder: NSCoder) {
        super.init(coder: coder)
        self.game = game
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Delegate Function
    func didSavePlayer(_ player: Player) {
        print(player)
        if newPlayers.count >= 0 {
            self.newPlayers.append(player)
        } else {
            newPlayers += [player]
        }
        playersTableView.reloadData()
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New Game"
//        playerArray = []
//        game = nil
////        print("Game \(game?.title)")
        print(newPlayers)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        print("Game \(game?.title)")
        
    }
    
    func createNewGame() {
        var highestSort = false
        var highestWins = false
        let gameTitle = gameTitleTextfield.text ?? ""
        let gameImage = UIImage(systemName: "die.face.6")!
    
        if sortPlayerBySegControl.selectedSegmentIndex == 0 {
            highestSort = true
        } else {
            highestSort = false
        }
        if whoWinsSegControl.selectedSegmentIndex == 0 {
            highestWins = true
        } else {
            highestWins = false
        }
        
        game = Game(
            title: gameTitle,
            gameImage: gameImage,
            currentWinner: newPlayers[0],
            players: newPlayers,
            highestSort: highestSort,
            highestWins: highestWins)
        print("\(game!.highestSort)  \(game!.highestWins)")
    }
    
    
    //MARK: Save New Game
    @IBAction func saveButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "saveNewGame", sender: sender)
    }
    
    //MARK: AutoUpdate NavTitle
    
    @IBAction func gameTitleChanged(_ sender: Any) {
        navigationItem.title = gameTitleTextfield.text
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveNewGame" {
            createNewGame()
        }
        if segue.identifier == "addNewPlayer" { // Use your actual segue identifier
                let addEditPlayerVC = segue.destination as! AddEditPlayerViewController
                addEditPlayerVC.delegate = self // Set delegate to self
            }
        let addEditPlayerVC = segue.destination as? AddEditPlayerViewController
        addEditPlayerVC?.delegate = self
    }
    
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
    // MARK: - Navigation

}

////MARK: Extension for TableView
//extension NewGameViewController: UITableViewDataSource, UITableViewDelegate {
//    //TableView DataSource
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return newPlayers.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newPlayerCell") as? NewGameNewPlayerCell else { return UITableViewCell() }
//        
//        let newPlayer = newPlayers[indexPath.row]
//        
//        cell.newPlayerImageView.image = newPlayer.userImage
//        cell.newPlayerNameLabel.text = newPlayer.name
//        cell.newPlayerScoreLabel.text = newPlayer.currentScore
//        
//        return cell
//    }
//}
