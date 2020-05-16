//
//  InputPhoneVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 12.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import UIKit

class InputPhoneVC: UIViewController {
    
    var isAccountExist = false
    
    var group = DispatchGroup()
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var doneButtonOutlet: UIButton!
    
    @IBAction func doneButton(_ sender: Any) {
        
        guard let phoneNumberTextFieldText = phoneNumberTextField.text else { return }
        
        DispatchQueue.main.async {
            self.isAccountExist = RequestList.isAccountExist(phone: phoneNumberTextFieldText)
            
            
            if self.isAccountExist {
                let smsCodeViewController = self.storyboard?.instantiateViewController(
                    withIdentifier: "InputSMSCodeVC"
                    ) as! InputSMSCodeVC
                
                self.navigationController!.pushViewController(smsCodeViewController, animated: true)
            } else {
                let registrationVC = self.storyboard?.instantiateViewController(
                    withIdentifier: "RegistrationVC"
                    ) as! RegistrationVC
                
                self.navigationController!.pushViewController(registrationVC, animated: true)
            }
        }
    }
    
    // MARK: - System
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
