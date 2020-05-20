//
//  ProfileCell.swift
//  TableViewPractice
//
//  Created by BriefOS on 2/12/2560 BE.
//  Copyright © 2560 BriefOS. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ imageName: String, title: String, sub: String) {
        logoImage.image = UIImage(named: imageName)
        titleLabel.text = title
        subLabel.text = sub
    }
}
