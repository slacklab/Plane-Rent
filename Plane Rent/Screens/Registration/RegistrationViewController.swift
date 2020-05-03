//
//  RegistrationViewController.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 03.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation

struct RegistrationViewController {
    
    func addUser(phone: String, name: String, lastName: String, accountType: String, address: String) -> String {
        
        var result = ""
        
        let link = Links.generateAddUser(phone: phone, name: name, lastName: lastName, type: accountType, address: address)
        
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: link)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            result = String(data: data, encoding: .utf8)!
            print(result)
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return result
    }
    
    
    
}
