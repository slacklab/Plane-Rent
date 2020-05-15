//
//  Validate.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 15.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation

struct Validate {
    static func phone(_ phoneNumber: String) -> Bool {
        
        let countDigit = phoneNumber.count
        let isRightSize = (countDigit > 6) && (countDigit < 11)
        
        switch isRightSize {
        case true:
            return true
        default:
            return false
        }
    }
}
