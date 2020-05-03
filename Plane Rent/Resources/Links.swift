//
//  Links.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 01.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation

struct Links {
    
    // MARK: - Constants
    
    static let apiPath = "http://big-marka.xyz/"
    static let smsApiId = "710A5C25-EE51-A775-ED86-4D371CF98E5D"
    
    // MARK: - Methods
    
    static func generateSmsSend(api_id: String = Links.smsApiId, phone: String, message: String) -> String {
        return "https://sms.ru/sms/send?api_id=" + smsApiId + "&to=" + phone + "&msg=" + message + "&json=1"
    }
    
    static func generateLoginUserCheck(phone: String) -> String {
        return apiPath + "DB_SELECT.php?select=loginUserCheck&selfrom=air_users&where=" + phone
    }
    
    static func generateAddUser(
        phone: String,
        name: String,
        lastName: String,
        type: String,
        address: String) -> String {
        
        return "http://big-marka.xyz/DB_REGISTER.php?select=addUser&phone=" + phone + "&name=" + name + "&lastName=" + lastName + "&type=" + type + "&address=" + address
    }
}
