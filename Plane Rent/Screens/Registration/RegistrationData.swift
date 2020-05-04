//
//  RegistrationData.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 04.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import Combine

//class RegistrationData: ObservableObject {
//    let didChange = PassthroughSubject<RegistrationData,Never>()
//
//    let willChange = PassthroughSubject<RegistrationData,Never>()
//
//    func register() {
//        if RegistrationViewController().addUser(phone: "7245", name: "name", lastName: "56", accountType: "Passe", address: "daf") {
//            // login request... on success:
//            self.isRegister = true
//        }
//    }
//
//    var isRegister = false {
//        didSet {
//            didChange.send(self)
//        }
//    }
//}


class LoginModel : ObservableObject {

    var didChange = PassthroughSubject<LoginModel, Never>()

    private(set) var username: String? {
        didSet {
            didChange.send(self)
        }
    }

    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.username = "Sorin"
        }
    }
}
