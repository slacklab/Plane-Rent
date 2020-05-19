//
//  Helpers.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 19.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation

struct Helpers {
    
    static func clearUserDefaults() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        #if DEBUG
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
        #endif
    }
    
    
}
