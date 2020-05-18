//
//  AirUser.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 18.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation

//{"air_users":[{"user_id":"70","user_phone":"9","user_name":"A","user_lastname":"B","user_address":"C"}]}

class AirUsers: Codable {
    let air_users: [AirUser]
    
    init(air_users: [AirUser]) {
        self.air_users = air_users
    }
}

// MARK: - AirUser
class AirUser: Codable {
    let user_id, user_phone, user_name, user_lastname: String
    let user_address: String
    
    init(user_id: String,
         user_phone: String,
         user_name: String,
         user_lastname: String,
         user_address: String) {
        self.user_id = user_id
        self.user_phone = user_phone
        self.user_name = user_name
        self.user_lastname = user_lastname
        self.user_address = user_address
    }
}
