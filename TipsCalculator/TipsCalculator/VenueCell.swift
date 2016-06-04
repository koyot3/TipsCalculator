//
//  VenueCell.swift
//  TipsCalculator
//
//  Created by admin on 04/06/16.
//  Copyright © 2016 hoang. All rights reserved.
//

import UIKit

class VenueCell: UITableViewCell {

    @IBOutlet weak var venueIcon: UIImageView!
    @IBOutlet weak var percentTage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
