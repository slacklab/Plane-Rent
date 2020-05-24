//
//  ProfileCell.swift
//  TableViewPractice
//
//  Created by BriefOS on 2/12/2560 BE.
//  Copyright © 2560 BriefOS. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subLabel: UILabel!

    @IBOutlet weak var actionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(title: String, sub: String, buttonImage: UIImage) {
        titleLabel.text = title
        subLabel.text = sub
        actionButton.setImage(buttonImage, for: .normal)
    }
}
