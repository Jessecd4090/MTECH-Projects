//
//  FamilyMemberTableViewCell.swift
//  Introduce My Family
//
//  Created by Jestin Dorius on 3/19/25.
//

import UIKit

class FamilyMemberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fmImageView: UIImageView!
    @IBOutlet weak var fmNameLabel: UILabel!
    @IBOutlet weak var occupationLabel1: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
