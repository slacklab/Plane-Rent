//
//  InputPhoneController.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 02.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import SwiftHTTP
import SwiftUI

struct InputPhoneController {
    
    let defaults = UserDefaults.standard
    
    func isAccountExist(phone: String) -> Bool {
        var isExist = false
        
        var semaphore = DispatchSemaphore (value: 0)
        
        let link = Links.generateLoginUserCheck(phone: phone)
        var request = URLRequest(url: URL(string: link)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            let error = StatusResponse.error.rawValue
            var result = String(data: data, encoding: .utf8)!
            print(result)
            if result.contains(error) {
                print("User not exist: open registration screen")
                isExist = false
                self.defaults.set(false, forKey: UserDefaultList.firstAuth)
            } else {
                print("User exist: Login with sms")
                isExist = true
                self.defaults.set(true, forKey: UserDefaultList.firstAuth)
            }
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return isExist
    }
    

}
