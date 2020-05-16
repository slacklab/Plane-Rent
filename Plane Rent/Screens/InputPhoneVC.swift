//
//  InputPhoneVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 12.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import UIKit

class InputPhoneVC: BaseViewController {
    
    var isAccountExist = false
    var inputedPhone = ""
    
    var group = DispatchGroup()
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var doneButtonOutlet: UIButton!
    
    @IBAction func doneButton(_ sender: Any) {
        
        guard let phoneNumberTextFieldText = phoneNumberTextField.text else { return }
        inputedPhone = phoneNumberTextFieldText

        DispatchQueue.main.async {
            self.isAccountExist = RequestList.isAccountExist(phone: phoneNumberTextFieldText)
            
            if self.isAccountExist {
                let inputSMSCodeVC = self.storyboard?.instantiateViewController(
                    withIdentifier: "InputSMSCodeVC"
                    ) as! InputSMSCodeVC

                self.navigationController!.pushViewController(inputSMSCodeVC, animated: true)
                
                inputSMSCodeVC.inputedPhone = self.inputedPhone
            } else {
                let registrationVC = self.storyboard?.instantiateViewController(
                    withIdentifier: "RegistrationVC"
                    ) as! RegistrationVC
                
                self.navigationController!.pushViewController(registrationVC, animated: true)
                
                registrationVC.inputedPhone = self.inputedPhone
            }
        }
    }
    
    // MARK: - System
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        navigationController?.isToolbarHidden = false
    }
}
