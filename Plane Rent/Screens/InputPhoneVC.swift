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
        
        if isAccountExist {
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
    
    // MARK: - System
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSmsCodeVC" {
            let vc = segue.destination as! InputSMSCodeVC
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
}




//    if Validate.phone(phoneNumberTextFieldText) {
//        print("ok")
//
//
//
//        DispatchQueue.main.async {
//            self.isAccountExist = RequestList.isAccountExist(phone: phoneNumberTextFieldText)
//        }
//
//        // when request will be done
//        group.notify(queue: .main) {
//
//            if self.isAccountExist {
//                let inputSMSCodeVC = self.storyboard?.instantiateViewController(withIdentifier: "InputSMSCodeVC")
//                self.navigationController?.pushViewController(inputSMSCodeVC!, animated: true)
//
//
//                self.navigationController?.pushViewController(SelectRoleVC(), animated: true)
//            } else {
//                // open RegistrationVC
//                self.navigationController?.pushViewController(RegistrationVC(), animated: true)
//            }
//
//
//        }
//
//
//    } else {
//        print("nope")
//        self.doneButtonOutlet.imageView?.rotate()
//    }         // validate.phone
//
//
//
//
//}
