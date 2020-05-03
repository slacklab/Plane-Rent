//
//  RegistrationView.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 02.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    
    let regitstrationApplyButton = BaseApplyButtonView()
    
    @Binding var phoneNumber: String
    
    
    @State var name: String
    @State var lastName: String
    @State var address: String
    @State var accountType: String
    
    @State var checkPilotState: Bool = false
    @State var checkPassengerState: Bool = false
    @State var checkOwnerState: Bool = false
    
    
    var body: some View {
        NavigationView {
            
            // MARK: - Textfield, text
            
            VStack(alignment: .leading) {
                
                

                
                // MARK: - LastName
                
                TextField("Фамилия", text: $lastName) {
                    UIApplication.shared.endEditing()
                }
                .keyboardType(.default)
                .frame(width: 250, height: 50, alignment: .center)
                .font(.title)
                Text("___________________________")
                    .frame(width: 250, alignment: .center)
                
                // MARK: - Address
                
                TextField("Адрес", text: $address) {
                    UIApplication.shared.endEditing()
                }
                .keyboardType(.default)
                .frame(width: 250, height: 50, alignment: .center)
                .font(.title)
                Text("___________________________")
                    .frame(width: 250, alignment: .center)
                    
                    .background(Colors.bgColor)
                
                // MARK: - CheckBoxes, Apply
                
                // MARK: - Pilot

                Button(action:
                    {
                        self.checkPilotState = !self.checkPilotState
                        self.checkPassengerState = false
                        self.checkOwnerState = false
                        print("State : \(self.checkPilotState)")
                }) {
                    HStack(alignment: .top, spacing: 10) {
                        Rectangle()
                            .fill(self.checkPilotState ? Color.green : Color.red)
                            .frame(width:20, height:20, alignment: .center)
                            .cornerRadius(5)
                        
                        Text(AccountType.pilot)
                    }
                }
                .foregroundColor(Color.white)

                // MARK: - Passenger

                Button(action:
                    {
                        self.checkPilotState = false
                        self.checkPassengerState = !self.checkPassengerState
                        self.checkOwnerState = false
                        print("State : \(self.checkPassengerState)")
                }) {
                    HStack(alignment: .top, spacing: 10) {
                        Rectangle()
                            .fill(self.checkPassengerState ? Color.green : Color.red)
                            .frame(width:20, height:20, alignment: .center)
                            .cornerRadius(5)
                        
                        Text(AccountType.passenger)
                    }
                }
                .foregroundColor(Color.white)

                // MARK: - Owner

                Button(action:
                    {
                        self.checkPilotState = false
                        self.checkPassengerState = false
                        self.checkOwnerState = !self.checkOwnerState
                        print("State : \(self.checkOwnerState)")
                }) {
                    HStack(alignment: .top, spacing: 10) {
                        Rectangle()
                            .fill(self.checkOwnerState ? Color.green : Color.red)
                            .frame(width:20, height:20, alignment: .center)
                            .cornerRadius(5)
                        
                        Text(AccountType.passenger)
                    }
                }
                .foregroundColor(Color.white)

                
                // MARK: - Apply
                
                NavigationLink(destination: ProfileTemplateDelete()) {
                    regitstrationApplyButton
                }
                
            }
            .background(Colors.bgColor)

            
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.bgColor)
        .modifier(DismissingKeyboard())
    }
}

//struct RegistrationViewTitle: View {
//    @Binding var name: String
//
//    var body: some View {
//        // MARK: - Title
//
//        Text("Регистрация")
//            .font(.largeTitle)
//            .foregroundColor(Color.white)
//            .background(Colors.bgColor)
//
//        // MARK: - Name
//
//        Text("Имя") {
//
////        TextField("Имя", text: $name) {
//            UIApplication.shared.endEditing()
//        }
//        .keyboardType(.default)
//        .frame(width: 250, height: 50, alignment: .center)
//        .font(.title)
//        Text("___________________________")
//            .frame(width: 250, alignment: .center)
//
//    }
//}

struct RegistrationViewTitleWithTextFields: View {
    var body: some View {
        Text("Регистарция")
            .font(.largeTitle)
            .foregroundColor(Color.green)
            .background(Colors.bgColor)
    }
}




