//
//  RentPlaneVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class RentPlaneVC: BaseViewController {
    
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var rentDatePicker: UIDatePicker!
    
    var selectedCell: Int = 0
    var helicopters = [Helicopter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        rentDatePicker.addTarget(self, action: Selector("handler:"), for: UIControl.Event.valueChanged)

        
        // TODO: extra code
        print(selectedCell)
        
        modelLabel.text = helicopters[selectedCell].helicopter_model
        baseLabel.text = helicopters[selectedCell].helicopter_base
        priceLabel.text = helicopters[selectedCell].helicopter_price
        
        
        let helicopterImagesDir = "http://big-marka.xyz/helicopter_images/"
        
        if let imageURL = URL(string:
            ((helicopterImagesDir + helicopters[selectedCell].helicopter_image)
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        )) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.mainImage.image = image
                    }
                }
            }
        }
        
    }
    
    override func dismissKeyboardOnTap() {
        
    }
    
//    func handler(sender: UIDatePicker) {
////        var timeFormatter = DateFormatter()
////        timeFormatter.timeStyle = DateFormatter.Style.short
////
////        var strDate = timeFormatter.string(from: rentDatePicker.date)
////        // do what you want to do with the string.
////
//        let formatter = DateFormatter()
//        formatter.dateStyle = DateFormatter.Style.medium
//        var strDate = formatter.string(from: sender.date)
//
//
//
//        print(strDate)
//    }
    
}
