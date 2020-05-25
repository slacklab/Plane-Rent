//
//  AddImageCell.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 24.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class AddImageCell: UITableViewCell {
    
    var delegate : ImagePickerDelegate?

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var addImageButton: UIButton!
    
    @IBAction func addImageButton(_ sender: Any) {
        delegate?.pickImage()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(image: UIImage) {
        addImageButton.setImage(image, for: .normal)
    }
    
}
