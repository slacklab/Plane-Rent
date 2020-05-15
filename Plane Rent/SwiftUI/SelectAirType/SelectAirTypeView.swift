//
//  SelectAirTypeView.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 05.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import SwiftUI

struct SelectAirTypeView: View {
    var body: some View {
        
        ZStack {
            
//            Colors.bgColor.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                
                RegistrationViewTitle()
                
                Group {
                    
                    Divider()
                    
                    
                    Divider()
                }
            }

            
        }
        .navigationBarHidden(true)
        .navigationBarTitle(Text("Home"))
    }
}
