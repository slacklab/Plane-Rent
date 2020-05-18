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
    
    let localeId = Locale.preferredLanguages.first
    var dateRent = ""
    
    var selectedCell: Int = 0
    var helicopters = [Helicopter]()

    @IBAction func doneButton(_ sender: Any) {
        let isDateRentRight = !dateRent.isEmpty
        
        if isDateRentRight {
            let bookedVC = self.storyboard?.instantiateViewController(
                withIdentifier: "BookedVC"
                ) as! BookedVC
            
            self.navigationController!.pushViewController(bookedVC, animated: true)
            
            SmsService.send(phone: helicopters[selectedCell].user_phone, message: Constant.appName + Constant.msgRented)
            
        } else {
            print("rent date wrong")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        rentDatePicker.locale = Locale(identifier: localeId ?? "")
        rentDatePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        
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
    
    @objc func datePickerChanged(_: Any) {
        getDateFromPicker()
    }
    
    func getDateFromPicker() {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd.MM.yyyy HH:MM"
        
        dateRent = formatter.string(from: rentDatePicker.date)
        
        #if DEBUG
        print(dateRent)
        #endif
    }
}
