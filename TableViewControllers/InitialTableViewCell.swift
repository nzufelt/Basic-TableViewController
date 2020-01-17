//
//  InitialTableViewCell.swift
//  TableViewControllers
//
//  Created by Nicholas Zufelt on 1/13/20.
//  Copyright © 2020 Nicholas Zufelt. All rights reserved.
//

import UIKit

class InitialTableViewCell: UITableViewCell {

    @IBOutlet weak var studentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
