import UIKit

class AddEditPlayerViewController: UIViewController {
    
    var player: Player?
    
    @IBOutlet weak var playerNameTextField: UITextField!
    var playerName: String = ""
    @IBOutlet weak var playerCurrentScoreTextField: UITextField!
    var playerCurrentScore: String = ""
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerNameTextField.text = playerName
        playerCurrentScoreTextField.text = playerCurrentScore
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let playerNameFrom = playerNameTextField.text, let playerCurrentScoreFrom = playerCurrentScoreTextField.text else { return }
        
        
        player = Player(userImage: UIImage(systemName: "person.circle.fill")!, name: playerNameFrom, currentScore: playerCurrentScoreFrom)
        performSegue(withIdentifier: "saveUnwind", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let sourceVC = segue.source as? ScoreboardTableViewController else { return }
//        
//        let playerName = playerNameTextField.text
//        let playerScore = playerCurrentScoreTextField.text
//        if segue.identifier == "saveUnwind" {
//            
//        }
//    }
    
}

