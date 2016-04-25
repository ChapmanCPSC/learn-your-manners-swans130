//
//  MannerTableViewCell.swift
//  Manners
//
//  Created by Chase Swanstrom on 4/17/16.
//  Copyright © 2016 Chase Swanstrom. All rights reserved.
//

import UIKit

class MannerTableViewCell: UITableViewCell {

    @IBOutlet weak var mannerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
