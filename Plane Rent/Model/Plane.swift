//
//  Plane.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation

//{"air_airplanes":[{"plane_id":"1","plane_model":"Кукурузник","plane_base":"Шереметьево","plane_price":"10000","plane_ownerid":"65","ts_right":"Собственность","ts_certificate":"Типовой","ts_CWS":"до
//20.05.2030","ts_min_flight":"50","ts_min_this_type_flight":"10","ts_check_flight":"1","ts_flight_to_airfields":"3","plane_image":"http:\/\/big-marka.xyz\/plane_images\/kukuruznik_4.jpg"},{"plane_id":"2","plane_model":"Boeing-747","plane_base":"Домодедово","plane_price":"55000","plane_ownerid":"66","ts_right":"Аренда","ts_certificate":"Типовой","ts_CWS":"Нет","ts_min_flight":"3","ts_min_this_type_flight":"1","ts_check_flight":"Нет","ts_flight_to_airfields":"Нет","plane_image":"http:\/\/big-marka.xyz\/plane_images\/boeing_747_24.jpg"},{"plane_id":"5","plane_model":"N800JP","plane_base":"Аэродром
//маячково","plane_price":"9000","plane_ownerid":"66","ts_right":"Собственность","ts_certificate":"ЕЭВС","ts_CWS":"до
//21.09.2029","ts_min_flight":"90","ts_min_this_type_flight":"20","ts_check_flight":"Нет","ts_flight_to_airfields":"10","plane_image":"13_05_202001_41_275993358image
//(1).jpg"}]}


//{"air_airplanes":[{"plane_id":"2","plane_model":"Boeing-747","plane_base":"Домодедово","plane_price":"55000","plane_ownerid":"66","ts_right":"Аренда","ts_certificate":"Типовой","ts_CWS":"Нет","ts_min_flight":"3","ts_min_this_type_flight":"1","ts_check_flight":"Нет","ts_flight_to_airfields":"Нет","plane_image":"boeing_747_24.jpg","user_phone":"79067092065"},{"plane_id":"6","plane_model":"N800
//2","plane_base":"Шереметьево","plane_price":"600","plane_ownerid":"66","ts_right":"Собственность","ts_certificate":"Типовой","ts_CWS":"20.06.2021","ts_min_flight":"70","ts_min_this_type_flight":"10","ts_check_flight":"Нет","ts_flight_to_airfields":"5","plane_image":"14_05_202001_55_072525876image
//(1).jpg","user_phone":"79067092065"},{"plane_id":"12","plane_model":"N800JP","plane_base":"Шереметьево","plane_price":"5000","plane_ownerid":"78","ts_right":"Собственность","ts_certificate":"ЕЭВС","ts_CWS":"До
//20.03.2021","ts_min_flight":"90","ts_min_this_type_flight":"20","ts_check_flight":"Нет","ts_flight_to_airfields":"5","plane_image":"15_05_202003_58_101178742image
//(1).jpg","user_phone":"79197762070"}]}

/// This need for main `air_airplanes` dictionary
class Planes: Codable {
    let air_airplanes: [Plane]
    
    init(air_airplanes: [Plane]) {
//        self.air_airplanes = air_planes
    self.air_airplanes = air_airplanes
    }
}

class Plane: Codable {
    let plane_id: String
    let plane_model: String
    let plane_base: String
    let plane_price: String
    let plane_ownerid: String
    let ts_right: String
    let ts_certificate: String
    let ts_CWS: String
    let ts_min_flight: String
    let ts_min_this_type_flight: String
    let ts_check_flight: String
    let ts_flight_to_airfields: String
    let plane_image: String
    let user_phone: String
    
    init(plane_id: String,
         plane_model: String,
         plane_base: String,
         plane_price: String,
         plane_ownerid: String,
         ts_right: String,
         ts_certificate: String,
         ts_CWS: String,
         ts_min_flight: String,
         ts_min_this_type_flight: String,
         ts_check_flight: String,
         ts_flight_to_airfields: String,
         plane_image: String,
         user_phone: String) {
        
        self.plane_id = plane_id
        self.plane_model = plane_model
        self.plane_base = plane_base
        self.plane_price = plane_price
        self.plane_ownerid = plane_ownerid
        self.ts_right = ts_right
        self.ts_certificate = ts_certificate
        self.ts_CWS = ts_CWS
        self.ts_min_flight = ts_min_flight
        self.ts_min_this_type_flight = ts_min_this_type_flight
        self.ts_check_flight = ts_check_flight
        self.ts_flight_to_airfields = ts_flight_to_airfields
        self.plane_image = plane_image
        self.user_phone = user_phone
    }
}
