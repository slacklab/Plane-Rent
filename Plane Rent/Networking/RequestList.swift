//
//  RequestList.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 15.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation

struct RequestList {
    static let defaults = UserDefaults.standard
    
    static func isAccountExist(phone: String) -> Bool {
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
                defaults.set(false, forKey: UserDefaultList.hasFirstAuth)
            } else {
                print("User exist: Login with sms")
                isExist = true
                defaults.set(true, forKey: UserDefaultList.hasFirstAuth)
            }
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return isExist
    }
    
    static func register(phone: String, name: String, lastName: String, address: String) -> Bool {
        var isSuccess = false
        
        let linkGenerated = Links.generateAddUser(phone: phone, name: name, lastName: lastName, address: address)
        
        let link = linkGenerated.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: link)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let result = (String(data: data, encoding: .utf8)!)
            
            #if DEBUG
            print(result)
            #endif
            
            if result.contains(StatusResponse.regSuccess.rawValue) ||
                result.contains(StatusResponse.regSuccess2.rawValue) {
                isSuccess = true
            }
            
            if result.contains(StatusResponse.regError.rawValue) {
                isSuccess = false
            }
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return isSuccess
    }
    
}
