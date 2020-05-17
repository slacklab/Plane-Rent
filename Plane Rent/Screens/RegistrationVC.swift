//
//  RegistrationVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class RegistrationVC: BaseViewController {
    var inputedPhone = ""
    
    @IBOutlet weak var titleCabinetLabel: UILabel!
    @IBOutlet weak var subTitleCabinetLabel: UILabel!
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var addressTextfield: UITextField!
    
    @IBAction func doneButton(_ sender: Any) {
        guard let nameTextfieldText = nameTextfield.text else { return }
        guard let lastNameTextfieldText = lastNameTextfield.text else { return }
        guard let addressTextfieldtext = addressTextfield.text else { return }
        
        DispatchQueue.main.async {
            let isRegisterSuccess = RequestList.register(phone: self.inputedPhone,
                                                         name: nameTextfieldText,
                                                         lastName: lastNameTextfieldText,
                                                         address: addressTextfieldtext)
            if isRegisterSuccess {
                let inputSMSCodeVC = self.storyboard?.instantiateViewController(
                    withIdentifier: "InputSMSCodeVC"
                    ) as! InputSMSCodeVC
                
                self.navigationController!.pushViewController(inputSMSCodeVC, animated: true)
                
                inputSMSCodeVC.inputedPhone = self.inputedPhone
            } else {
                print("register - unsuccess")
            }
            
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
