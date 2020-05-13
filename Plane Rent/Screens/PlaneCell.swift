//
//  PlaneCell.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class PlaneCell: UITableViewCell {

    @IBOutlet weak var planeModelLabel: UILabel!
    @IBOutlet weak var planeAirportLabel: UILabel!
    @IBOutlet weak var planePriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
