//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Jestin Dorius on 3/10/25.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        emojis = Emoji.loadFromFile()
        if emojis.isEmpty {
            emojis = Emoji.sampleEmojis()
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUwind",
            let sourceVC = segue.source as? AddEditEmojiTableViewController,
            let emoji = sourceVC.emoji else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        }
        
        
        // Use data from the view controller which initiated the unwind segue
    

    
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditEmojiTableViewController? {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            //editing the emoji
            let emojiToEdit = emojis[indexPath.row]
            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
        } else {
            // Adding the emoji
            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
        }
        
    }
    
    
    @IBAction func addNewButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "addNew", sender: sender)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "editEmoji",
//           let destinationVC = segue.destination as? AddEditEmojiViewController,
//           let selectedEmoji = sender as? Emoji {
//            destinationVC.navigationItem.title = "Edit Emoji"
//            destinationVC.emojiToEdit = selectedEmoji
//        }
//        if segue.identifier == "addNew",
//           let destinationVC = segue.destination as? AddEditEmojiViewController {
//            destinationVC.navigationItem.title = "Add New"
//        }
//    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let emoji = emojis[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "\(emoji.symbol) - \(emoji.name)"
        content.secondaryText = emoji.description
        cell.selectionStyle = .gray
        cell.contentConfiguration = content
        
        cell.showsReorderControl = true
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedEmoji = emojis[indexPath.row]
//        performSegue(withIdentifier: "editEmoji", sender: selectedEmoji)
//    }
    
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Deleting the element from the dataSource
         emojis.remove(at: indexPath.row)
     // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         
     }
     }
     
     
     /*
      // Override to support rearranging the table view.
      override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
      
      }
      */
     
     /*
      // Override to support conditional rearranging of the table view.
      override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the item to be re-orderable.
      return true
      }
      */
     
     /*
      // MARK: - Navigation
      
      // In a storyboard-based application, you will often want to do a little preparation before navigation
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
      }
      */
    
    
}
