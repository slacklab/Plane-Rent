//
//  Requests.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 02.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import SwiftHTTP

struct Requests {
    func userLoginCheck(phone: String, finished: ((Bool) -> Void)) -> Void {        
        let link = Links.generateLoginUserCheck(phone: phone)
        
        HTTP.GET(link) { response in
            if let err = response.error {
                print("error: \(err.localizedDescription)")
                return
            }
            
            print(response.text ?? "nil")
        }
    }
    
    func addUser(phone: String, name: String, lastName: String, type: String, address: String) {
        let link = Links.generateRegister(phone: phone, name: name, lastName: lastName, type: type, address: address)
    }
}
