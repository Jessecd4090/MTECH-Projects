//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Jestin Dorius on 3/10/25.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         navigationItem.leftBarButtonItem = editButtonItem
    }
   
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
        .none
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let emoji = emojis[indexPath.row]
        print("\(emoji.symbol) - \(indexPath)")
    }
    
    var emojis: [Emoji] = [
        Emoji(symbol: "🙉", name: "Hear no Evil", description: "A monkey covering his ears to avoid hearing evil", usage: "Plausible Deniability"),
        Emoji(symbol: "🙈", name: "See no Evil", description: "A monkey covering his eyes to avoid seeing evil", usage: "Hiding or secret things"),
        Emoji(symbol: "🙊", name: "Speak no Evil", description: "A monkey covering his mouth to not speak evil", usage: "Holding my tongue"),
        Emoji(symbol: "🍀", name: "4-Leafed Clover", description: "A lucky clover", usage: "Lucky energy"),
        Emoji(symbol: "🥀", name: "Rose", description: "A rose with a stem", usage: "Romantic energy"),
        Emoji(symbol: "🌨️", name: "Snowy day", description: "A cloud with snow falling out of it", usage: "Snowy or cold days"),
        Emoji(symbol: "😳", name: "Nervous", description: "A nervous face, probably embarassed", usage: "Embarassed"),
        Emoji(symbol: "🥹", name: "Happy Tears", description: "A sad face, that is crying happy tears", usage: "For crying happy tears")
        
    ]

  

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
