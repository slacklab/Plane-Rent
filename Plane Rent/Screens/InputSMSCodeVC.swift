//
//  InputSMSCodeVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import UIKit

class InputSMSCodeVC: BaseViewController {
    
    var inputedPhone = ""
    
    // TODO: replace to 6 digits
    var generatedCode = String.random(length: 4)
    var inputedCode = ""

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var smsCodeTextfield: UITextField!
    @IBAction func doneButton(_ sender: Any) {
        guard let smsCodeTextfieldText = smsCodeTextfield.text else { return }
        
        #if DEBUG
        print(smsCodeTextfieldText)
        print(self.generatedCode)
        #endif
        
        // TODO: uncomment
        let isInputedCodeRight = self.generatedCode == smsCodeTextfieldText
        
        if isInputedCodeRight {
            let selectRoleVC = self.storyboard?.instantiateViewController(
                withIdentifier: "SelectRoleVC"
                ) as! SelectRoleVC
            
            self.navigationController!.pushViewController(selectRoleVC, animated: true)
            
            recordCurrentAccountPhoneNumber()
            
        } else {
            print("code - wrong")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneLabel.text = inputedPhone
        
        #if DEBUG
        print("Generated: \(generatedCode) code")
        #endif
        
        sendSmsCode()
    }
    
    func sendSmsCode() {
        DispatchQueue.main.async {
            SmsService.send(phone: self.inputedPhone,
                            message: Constant.appName + self.generatedCode)
        }
    }
    
    func recordCurrentAccountPhoneNumber() {
        let defaults = UserDefaults.standard
        defaults.set(self.inputedPhone, forKey: UserDefaultList.currentPhoneNumberOfUser)
    }
}
