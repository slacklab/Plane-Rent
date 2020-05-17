//
//  ResponseStatus.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 02.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation

enum StatusResponse: String {
    
    case error = "\"error\""
    case `false` = "\"false\""

    case `true` = "\"true\""
    case success = "\"success\""
    
    // Sms.ru
    case ok = "\"OK\""
    
    // Registration
    case regSuccess = "\"success\"\"error\""
    case regSuccess2 = "\"success\"\"success\""
    case regError = "\"error\"\"error\""
    
}
