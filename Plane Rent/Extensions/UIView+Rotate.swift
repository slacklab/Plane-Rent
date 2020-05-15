//
//  UIView+Rotate.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 15.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    // rotate image for 180?
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: M_PI * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = FLT_MAX
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
