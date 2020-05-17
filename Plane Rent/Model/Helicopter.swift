//
//  Helicopter.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 16.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

//{"air_helicopters":[{"helicopter_id":"1","helicopter_model":"K50","helicopter_base":"Мячково","helicopter_price":"3000","helicopter_ownerid":"78","ts_right":"Собственность","ts_certificate":"ЕЭВС","ts_CWS":"Нет","ts_min_flight":"10","ts_min_this_type_flight":"0","ts_check_flight":"1","ts_flight_to_airfields":"2","helicopter_image":"K50_4.jpg"},{"helicopter_id":"2","helicopter_model":"model_33","helicopter_base":"Шереметьево","helicopter_price":"1000","helicopter_ownerid":"66","ts_right":"Аренда","ts_certificate":"Типовой","ts_CWS":"До
//26.03.2021","ts_min_flight":"30","ts_min_this_type_flight":"50","ts_check_flight":"Нет","ts_flight_to_airfields":"Нет","helicopter_image":"model_33_24.jpeg"}]}

import Foundation

/// This need for main `air_helicopters` dictionary
class Helicopters: Codable {
    let air_helicopters: [Helicopter]
    
    init(air_helicopters: [Helicopter]) {
        self.air_helicopters = air_helicopters
    }
}

class Helicopter: Codable {
    let helicopter_id: String
    let helicopter_model: String
    let helicopter_base: String
    let helicopter_price: String
    let helicopter_ownerid: String
    let ts_right: String
    let ts_certificate: String
    let ts_CWS: String
    let ts_min_flight: String
    let ts_min_this_type_flight: String
    let ts_check_flight: String
    let ts_flight_to_airfields: String
    let helicopter_image: String
    let user_id: String
    let user_phone: String
    let user_name: String
    let user_lastname: String
    let user_address: String
    
    init(helicopter_id: String,
         helicopter_model: String,
         helicopter_base: String,
         helicopter_price: String,
         helicopter_ownerid: String,
         ts_right: String,
         ts_certificate: String,
         ts_CWS: String,
         ts_min_flight: String,
         ts_min_this_type_flight: String,
         ts_check_flight: String,
         ts_flight_to_airfields: String,
         helicopter_image: String,
         user_id: String,
         user_phone: String,
         user_name: String,
         user_lastname: String,
         user_address: String) {
        
        self.helicopter_id = helicopter_id
        self.helicopter_model = helicopter_model
        self.helicopter_base = helicopter_base
        self.helicopter_price = helicopter_price
        self.helicopter_ownerid = helicopter_ownerid
        self.ts_right = ts_right
        self.ts_certificate = ts_certificate
        self.ts_CWS = ts_CWS
        self.ts_min_flight = ts_min_flight
        self.ts_min_this_type_flight = ts_min_this_type_flight
        self.ts_check_flight = ts_check_flight
        self.ts_flight_to_airfields = ts_flight_to_airfields
        self.helicopter_image = helicopter_image
        self.user_id = user_id
        self.user_phone = user_phone
        self.user_name = user_name
        self.user_lastname = user_lastname
        self.user_address = user_address
    }
}

