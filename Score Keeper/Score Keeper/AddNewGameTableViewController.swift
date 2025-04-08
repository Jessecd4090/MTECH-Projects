//
//  AddNewGameTableViewController.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/31/25.
//

import UIKit

class AddNewGameTableViewController: UITableViewController {
    
    @IBOutlet weak var gameTitleTextField: UITextField!
    
    @IBOutlet weak var sortPlayerBySegControl: UISegmentedControl!
    
    let playerIndexPath = IndexPath(row: 1, section: 3)
    var newPlayers: [Player] = []
    var newGame: Game?
    var gameToEdit: Game? {
        didSet {
            guard gameToEdit != nil else { return }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        updatePlayerCells()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    //MARK: IBActions
    
    
   
    //MARK: Save New Game
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        var highestSort = false
        guard gameTitleTextField.text != "" else { return }
        let gameTitle = gameTitleTextField.text ?? ""
        let gameImage = UIImage(systemName: "die.face.6")!
        let currentWinner = player2
        let players = newPlayers
        if sortPlayerBySegControl.selectedSegmentIndex == 0 {
            highestSort = true
        } else {
            highestSort = false
        }
         
        
        newGame = Game(title: gameTitle, gameImage: gameImage, currentWinner: currentWinner, players: players, highestSort: highestSort)
    }
    
    @IBAction func gameTitleChanged(_ sender: Any) {
        navigationItem.title = gameTitleTextField.text
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? GamePlayerTableViewCell else { return UITableViewCell() }
            
            // Configure the cell...
            
            
            
            return cell
        }
        return super.tableView(tableView, cellForRowAt: indexPath)
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveNewGame" else { return }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    

}


