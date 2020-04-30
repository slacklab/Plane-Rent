//
//  DismissingKeyboard.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 30.04.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import SwiftUI

struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
                keyWindow?.endEditing(true)
        }
    }
}
