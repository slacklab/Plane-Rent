//
//  String+Random.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 03.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation

extension String {

    static func random(length: Int = 4) -> String {
        let base = "0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
