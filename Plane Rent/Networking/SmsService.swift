//
//  SmsService.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 01.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import SwiftHTTP

struct SmsService {
    
    static func send(api_id: String = Links.smsApiId, phone: String, message: String) {
        let link = Links.generateSmsSend(api_id: api_id, phone: phone, message: message)
        
        let linkEncoded = link.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        
        #if DEBUG
        print(linkEncoded)
        #endif
        
        // TODO: uncomment
        //        HTTP.GET(linkEncoded) { response in
        //            if let err = response.error {
        //                print("error: \(err.localizedDescription)")
        //                return
        //            }
        //
        //            let result = response.text ?? "nil"
        //            let statusOk = StatusResponse.ok.rawValue
        //
        //            print("value: \(result)")
        //
        //            if result.contains(statusOk) {
        //                print("Sms sended")
        //            } else {
        //                print("Sms error")
        //            }
        //        }
    }
}
