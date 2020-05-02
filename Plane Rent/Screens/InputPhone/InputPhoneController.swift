//
//  InputPhoneController.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 02.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import SwiftHTTP
import SwiftUI

struct InputPhoneController {
        
    func ifAccountExistLoginElseRegistration(phone: String, completionBlock: @escaping ((Bool) -> Void)) {
        let link = Links.generateLoginUserCheck(phone: phone)
                
        HTTP.GET(link) { response in
            if let err = response.error {
                print("error: \(err.localizedDescription)")
                return
            }
            
            let result = response.text ?? "nil"
            let error = StatusResponse.error.rawValue
            
            print("value: \(result)")
                        
            if result.contains(error) {
                print("User not exist: open registration screen")
                completionBlock(false)
            } else {
                print("User exist: Login with sms")
                completionBlock(true)
            }
        }
    }
}
