//
//  RegistrationViewController.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 03.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import SwiftHTTP

struct RegistrationViewController {
            
    func addUser(phone: String, name: String, lastName: String, address: String) -> Bool {
        
        var isAddUserSuccess: Bool = false
        var result = ""
        
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
            
            let success = StatusResponse.success.rawValue

            result = String(data: data, encoding: .utf8)!
            print(result)
            
            if result.contains(success) {
                isAddUserSuccess = true
                print("Registration success")
            } else {
                isAddUserSuccess = false
                print("Registration wrong")
            }
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return isAddUserSuccess
    }
}
