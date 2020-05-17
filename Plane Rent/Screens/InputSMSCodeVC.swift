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
    
    var generatedCode = String.random(length: 4)
    var inputedCode = ""

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var smsCodeTextfield: UITextField!
    @IBAction func doneButton(_ sender: Any) {
        guard let smsCodeTextfieldText = smsCodeTextfield.text else { return }
        inputedPhone = smsCodeTextfieldText
        
        // TODO: uncomment
        let isInputedCodeRight = true
//        let isInputedCodeRight = self.generatedCode == self.inputedPhone
        
        if isInputedCodeRight {
            let selectRoleVC = self.storyboard?.instantiateViewController(
                withIdentifier: "SelectRoleVC"
                ) as! SelectRoleVC
            
            self.navigationController!.pushViewController(selectRoleVC, animated: true)
        } else {
            print("code - wrong")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneLabel.text = inputedPhone
        
        // TODO: uncomment
//        sendSmsCode()
        
    }
    
    func sendSmsCode() {
        DispatchQueue.main.async {
            SmsService.send(phone: self.inputedPhone, message: self.generatedCode)
        }
    }
}
