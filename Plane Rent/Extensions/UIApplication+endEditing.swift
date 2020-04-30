//
//  UIApplication+endEditing.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 30.04.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    /// Close keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
