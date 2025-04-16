import UIKit



class AddEditPlayerViewController: UIViewController {
    
    var player: Player?
    var delegate: PlayerEditDelegate?
    
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var playerCurrentScoreTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if player != nil {
            playerNameTextField.text = player?.name
            playerCurrentScoreTextField.text = player?.currentScore
        }
//        playerNameTextField.text = playerName
//        playerCurrentScoreTextField.text = playerCurrentScore
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        print("save Tapped")
        
        guard let name = playerNameTextField.text, !name.isEmpty, let currentScore = playerCurrentScoreTextField.text, !currentScore.isEmpty else { return }
        
        if let existingPlayer = player {
            print("edited existing player")
            let updatedPlayer = Player(id: existingPlayer.id, userImage: existingPlayer.userImage, name: name, currentScore: currentScore)
            delegate?.didSavePlayer(updatedPlayer)
            navigationController?.popViewController(animated: true)
//            dismiss(animated: true)
        } else {
            print("new Player saved")
            let newPlayer = Player(name: name,
                                   currentScore: currentScore)
//            print(newPlayer.name)
            delegate?.didSavePlayer(newPlayer)
            navigationController?.popViewController(animated: true)
//            dismiss(animated: true)
        }
//        dismiss(animated: true)
        
    }
    
    
}

