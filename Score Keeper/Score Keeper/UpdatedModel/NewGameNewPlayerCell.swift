//
//  NewGameNewPlayerCell.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 4/14/25.
//

import UIKit

class NewGameNewPlayerCell: UITableViewCell {

    
    @IBOutlet weak var newPlayerImageView: UIImageView!
    @IBOutlet weak var newPlayerNameLabel: UILabel!
    @IBOutlet weak var newPlayerScoreLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
