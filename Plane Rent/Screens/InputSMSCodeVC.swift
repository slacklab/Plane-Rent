//
//  InputSMSCodeVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import UIKit

class InputSMSCodeVC: BaseViewController {
    let defaults = UserDefaults.standard
    
    var inputedPhone = ""
    
    // TODO: replace to 6 digits
    var generatedCode = String.random(length: 4)
    var inputedCode = ""
    
    var airUsers = [AirUser]()
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var smsCodeTextfield: UITextField!
    @IBAction func doneButton(_ sender: Any) {
        guard let smsCodeTextfieldText = smsCodeTextfield.text else { return }
        
        #if DEBUG
        print(smsCodeTextfieldText)
        print(self.generatedCode)
        #endif
        
        // TODO: uncomment
        let isInputedCodeRight = self.generatedCode == smsCodeTextfieldText
        
        if isInputedCodeRight {
            let selectRoleVC = self.storyboard?.instantiateViewController(
                withIdentifier: "SelectRoleVC"
                ) as! SelectRoleVC
            
            self.navigationController!.pushViewController(selectRoleVC, animated: true)
            
            recordCurrentAccountPhoneNumber()
            
            defaults.set(true, forKey: UserDefaultList.hasFirstAuth)

            DispatchQueue.main.async {
//                self.downloadJsonUserInfoByPhoneAsync()
                self.getInfoAboutUser()
                self.recordUserInfoToUserDefaults()
            }
        } else {
            defaults.set(false, forKey: UserDefaultList.hasFirstAuth)
            print("code - wrong")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneLabel.text = inputedPhone
        
        #if DEBUG
        print("Generated: \(generatedCode) code")
        #endif
        
        sendSmsCode()
    }
    
    func sendSmsCode() {
        DispatchQueue.main.async {
            SmsService.send(phone: self.inputedPhone,
                            message: Constant.appName + self.generatedCode)
        }
    }
    
    func recordCurrentAccountPhoneNumber() {
        let defaults = UserDefaults.standard
        defaults.set(self.inputedPhone, forKey: UserDefaultList.currentPhoneNumberOfUser)
    }
    
    func getInfoAboutUser() {
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: Links.generateLoginUserCheck(phone: self.inputedPhone))!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            print("downloaded user info")
            
            do {
                let decoder = JSONDecoder()
                
                let downloadAirusers = try decoder.decode(AirUsers.self, from: data)
                
                self.airUsers = downloadAirusers.air_users
                
            } catch {
                print("smth wrong after download user info")
            }
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
    }
    
    func downloadJsonUserInfoByPhoneAsync() {
        
        let urlGetInfoForUserByPhone = Links.generateLoginUserCheck(phone: self.inputedPhone)
        
        let url = URL(string: urlGetInfoForUserByPhone)
        
        guard let downloadUrl = url else { return }
        
        URLSession.shared.dataTask(with: downloadUrl) { data, urlResponse, error in
            
            guard let data = data, error == nil, urlResponse != nil else {
                print("smth wrong")
                return
            }
            
            print("downloaded")
            
            do {
                let decoder = JSONDecoder()
                
                let downloadAirusers = try decoder.decode(AirUsers.self, from: data)
                
                self.airUsers = downloadAirusers.air_users
                
            } catch {
                print("smth wrong after download")
            }
            
        }.resume()
    }
    
    func recordUserInfoToUserDefaults() {
        defaults.set(airUsers[0].user_name, forKey: UserDefaultList.currentAccountName)
        defaults.set(airUsers[0].user_lastname, forKey: UserDefaultList.currentAccountLastName)
    }
}
