//
//  RepresentativeTableController.swift
//  RandomAPIsPart1
//
//  Created by Jestin Dorius on 4/24/25.
//

import UIKit

class RepresentativeTableController: UITableViewController {

    @IBOutlet weak var zipSearchBar: UISearchBar!
    
    var zipcode = String()
    var reps = [Representative]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        zipSearchBar.delegate = self
        
        zipcode = zipSearchBar.text ?? "84660"
        tableView.rowHeight = 58
//        tableView.estimatedRowHeight = 300
        
        Task {
            do {
                reps = await RepresentativeController.getRep(zipcode: "84660")
                print(reps)
            }
            tableView.reloadData()
        }
        
    }
    
//    func viewDidAppear(_ animated: Bool) async {
//        await updateReps()
//    }
    
    func updateReps() async {
        do {
            reps = await RepresentativeController.getRep(zipcode: zipcode)
            print(reps)
        }
    }
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reps.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Representative", for: indexPath) as? RepCell else { return UITableViewCell() }

        
        let rep = reps[indexPath.row]
        // Configure the cell...
        cell.repNameLabel.text = rep.name
        cell.repPartyLabel.text = rep.party
        cell.repLinkLabel.text = rep.link
        

        return cell
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

extension RepresentativeTableController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else { return }
        Task {
            do {
                reps = await RepresentativeController.getRep(zipcode: searchBarText)
                print(reps)
            }
            tableView.reloadData()
        }
        print("Search Bar Clicked")
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else { return }
        Task {
            do {
                reps = await RepresentativeController.getRep(zipcode: searchBarText)
                print(reps)
            }
            tableView.reloadData()
        }
    }
}
