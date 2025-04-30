//
//  RepCell.swift
//  RandomAPIsPart1
//
//  Created by Jestin Dorius on 4/28/25.
//

import UIKit

class RepCell: UITableViewCell {

    @IBOutlet weak var repNameLabel: UILabel!
    @IBOutlet weak var repPartyLabel: UILabel!
    @IBOutlet weak var repLinkLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
