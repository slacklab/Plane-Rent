//
//  AircraftCell.swift
//  TableViewPractice
//
//  Created by BriefOS on 2/12/2560 BE.
//  Copyright © 2560 BriefOS. All rights reserved.
//

import UIKit

class AircraftCell: UITableViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var subSubLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func commonInit(_ imageName: UIImage, title: String, sub: String, subSub: String) {
        
            logoImage.image = imageName
            titleLabel.text = title
            subLabel.text = sub
            subSubLabel.text = subSub
    }
}
