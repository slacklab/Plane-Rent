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
    static func send(api_id: String, phone: String, message: String) {
        let link = Links.generateSmsSend(api_id: api_id, phone: phone, message: message)
    }
}
