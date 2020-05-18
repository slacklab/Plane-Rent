//
//  RentHelicopterVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class RentHelicopterVC: BaseViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var rentDatePicker: UIDatePicker!
    
    let localeId = Locale.preferredLanguages.first
    var dateRent = ""
    
    var selectedCell: Int = 0
    var helicopters = [Helicopter]()
    let helicopterImagesDir = "http://big-marka.xyz/helicopter_images/"
    
    @IBAction func doneButton(_ sender: Any) {
        let isDateRentRight = !dateRent.isEmpty
        
        if isDateRentRight {
            let bookedVC = self.storyboard?.instantiateViewController(
                withIdentifier: "BookedVC"
                ) as! BookedVC
            
            self.navigationController!.pushViewController(bookedVC, animated: true)
            // TODO: add ban for send sms
            sendNeedMessage()
            
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
        
        downloadImageAndSet()
        
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
    
    func downloadImageAndSet() {
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
    
    func sendNeedMessage() {
        
        // MARK: - Get values from UserDefaults
        
        guard let valueCurrentAccountType = defaults.string(forKey:
            UserDefaultList.currentAccountType) else { return }
        guard let valuePhoneNumberOfCurrentUser = defaults.string(forKey: UserDefaultList.currentPhoneNumberOfUser) else { return }
        
        guard let valueCurrentUserName = defaults.string(forKey: UserDefaultList.currentAccountName) else { return }
        
        guard let valueCurrentUserLastName = defaults.string(forKey: UserDefaultList.currentAccountLastName) else { return }
        
        #if DEBUG
        print(valueCurrentAccountType)
        print(valuePhoneNumberOfCurrentUser)
        print(valueCurrentUserName)
        print(valueCurrentUserLastName)
        #endif
        
        
        switch valueCurrentAccountType {
        case AccountType.passenger:
            SmsService.send(phone: helicopters[selectedCell].user_phone,
                            message: Constant.appName + "\(valueCurrentUserName) \(valueCurrentUserLastName) хочет арендовать у вас \(helicopters[selectedCell].helicopter_model) \(dateRent) в качестве пассажира. Телефон: \(valuePhoneNumberOfCurrentUser)")
        default:
            print("not set for send sms")
        }
    }
}
