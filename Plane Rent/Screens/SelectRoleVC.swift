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
        
        overrideNavBarBackItemForLogout()

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
    
    @objc func logout() {
        let submitAlert = UIAlertController(title: "Выход", message: "Вы действительно хотите выйти из аккаунта?", preferredStyle: UIAlertController.Style.alert)
        
        submitAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            
            Helpers.clearUserDefaults()

            let inputPhoneVC = self.storyboard?.instantiateViewController(
                withIdentifier: "InputPhoneVC"
                ) as! InputPhoneVC
            
            self.navigationController!.pushViewController(inputPhoneVC, animated: true)
        }))
        
        submitAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        self.present(submitAlert, animated: true, completion: nil)
    }
    
    func overrideNavBarBackItemForLogout() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.backArrowPdf(), style: .plain, target: self, action: #selector(logout))
    }
}
