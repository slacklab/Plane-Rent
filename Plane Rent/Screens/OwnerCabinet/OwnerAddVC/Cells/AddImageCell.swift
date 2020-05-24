//
//  AddImageCell.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 24.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class AddImageCell: UITableViewCell {

    @IBOutlet weak var addImageButton: UIButton!
    
    @IBAction func addImageButton(_ sender: Any) {
//        let chooseAlert = UIAlertController(
//            title: nil,
//            message: nil,
//            preferredStyle: .actionSheet)
//
//        chooseAlert.addAction(
//            UIAlertAction(
//                title: NSLocalizedString("Gallery", comment: ""),
//                style: .default,
//                handler: { [weak self] _ in
//                    guard let strongSelf = self else { return }
//                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//                        let imagePicker = UIImagePickerController()
//                        imagePicker.delegate = strongSelf
//                        imagePicker.sourceType = .photoLibrary;
//                        imagePicker.allowsEditing = false
//                        strongSelf.present(imagePicker, animated: true, completion: nil)
//                    }
//            }))
//
//        chooseAlert.addAction(
//            UIAlertAction(
//                title: NSLocalizedString("Camera", comment: ""),
//                style: .default) { [weak self] _ in
//                    guard let strongSelf = self else { return }
//                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
//                        let imagePicker = UIImagePickerController()
//                        imagePicker.delegate = strongSelf
//                        imagePicker.sourceType = .camera;
//                        imagePicker.allowsEditing = false
//                        strongSelf.present(imagePicker, animated: true, completion: nil)
//                    }
//        })
//
//        chooseAlert.addAction(
//            UIAlertAction(
//                title: "Cancel",
//                style: .cancel,
//                handler: nil))
//
//        self.present(chooseAlert, animated: true)

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
