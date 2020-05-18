//
//  SelectRoleVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class SelectRoleVC: BaseViewController {
    
    let defaults = UserDefaults.standard

    @IBAction func ownerButton(_ sender: Any) {
        recordAccountTypeOwner()
    }
    
    @IBAction func pilotButton(_ sender: Any) {
        recordAccountTypePilot()
    }
    
    @IBAction func passengerButton(_ sender: Any) {
        recordAccountTypePassenger()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Record current type of account to UserDefaults
    
    func recordAccountTypePassenger() {
        defaults.set(AccountType.passenger, forKey: UserDefaultList.currentAccountType)
    }
    
    func recordAccountTypePilot() {
        defaults.set(AccountType.pilot, forKey: UserDefaultList.currentAccountType)
    }
    
    func recordAccountTypeOwner() {
        defaults.set(AccountType.owner, forKey: UserDefaultList.currentAccountType)
    }
}
