//
//  BaseViewController.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 16.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissKeyboardOnTap()
        
        setupStatusBar()
        
        setupTabBar()

        setupNavigationBar()
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setupNavigationBar() {
        // make transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // dismiss grey line
        navigationController?.navigationBar.shadowImage = UIImage()
        // set text color
        navigationController?.navigationBar.tintColor = .white
        // dismiss "Back" text
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupStatusBar() {
        UITabBar.appearance().barTintColor = UIColor.clear
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
    func setupTabBar() {
        self.hidesBottomBarWhenPushed = true
        // try do disable at first controller 
        self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    
    func dismissKeyboardOnTap() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
}
