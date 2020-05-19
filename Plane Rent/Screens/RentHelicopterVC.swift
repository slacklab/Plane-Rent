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
            
            // TODO: add ban for send sms
            submitThenNotifyOwner()
            
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
        
        formatter.dateFormat = "dd.MM.yyyy"
        
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
    
    func submitThenNotifyOwner() {
        
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
            
            // MARK: - Submit alert and send message to owner
            
            let submitAlert = UIAlertController(title: "Подтвердите", message: "Заказать выбранное воздушное судно на \(self.dateRent)? Владельцу будет отправлена информация о вас и ваш номер телефона", preferredStyle: UIAlertController.Style.alert)
            
            submitAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")
                
                SmsService.send(phone: self.helicopters[self.selectedCell].user_phone,
                                message: Constant.appName + "\(valueCurrentUserName) \(valueCurrentUserLastName) хочет арендовать у вас \(self.helicopters[self.selectedCell].helicopter_model) \(self.dateRent) в качестве пассажира. Телефон: \(valuePhoneNumberOfCurrentUser)")
                 let bookedVC = self.storyboard?.instantiateViewController(
                     withIdentifier: "BookedVC"
                     ) as! BookedVC
                 
                 self.navigationController!.pushViewController(bookedVC, animated: true)
            }))
            
            submitAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            self.present(submitAlert, animated: true, completion: nil)
            
        default:
            print("not set for send sms")
        }
    }
}
