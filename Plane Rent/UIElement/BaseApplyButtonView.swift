//
//  BaseApplyButtonView.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 03.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import SwiftUI

struct BaseApplyButtonView: View {
    var body: some View {
        Image("plane")
            .renderingMode(.original)
            .resizable()
            .frame(width: 50, height: 50)
            .aspectRatio(contentMode: .fill)
            .clipped()
            .background(Colors.bgColor)
    }
}
