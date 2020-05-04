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
    
    @State var accountTypeNameChecked: String
    
    @State var checkPilotState: Bool = false
    @State var checkPassengerState: Bool = false
    @State var checkOwnerState: Bool = false
    
    @State var isAddUserSuccess = false
    
    var body: some View {
        NavigationView {
            
            
            
            
            // MARK: - Textfield, text
            
            VStack(alignment: .leading) {
                
                
//                if registrationData.isRegister {
//                    Text("Success1111")
//                } else {
//                    Text("Wrong11111")
//                }
                
                
                RegistrationViewTitle()
                
                // MARK: - Name
                
                TextField("Имя", text: $name) {
                    UIApplication.shared.endEditing()
                }
                .keyboardType(.default)
                .frame(width: 250, height: 50, alignment: .center)
                .font(.title)
                
                // MARK: - LastName
                
                TextField("Фамилия", text: $lastName) {
                    UIApplication.shared.endEditing()
                }
                .keyboardType(.default)
                .frame(width: 250, height: 50, alignment: .center)
                .font(.title)
                
                // MARK: - Address
                
                TextField("Адрес", text: $address) {
                    UIApplication.shared.endEditing()
                }
                .keyboardType(.default)
                .frame(width: 250, height: 50, alignment: .center)
                .font(.title)
                .background(Colors.bgColor)
                
                // MARK: - CheckBoxes, Apply
                
                // MARK: - Pilot
                
                Button(action:
                    {
                        self.checkPilotState = !self.checkPilotState
                        self.checkPassengerState = false
                        self.checkOwnerState = false
                        print("Pilot State : \(self.checkPilotState)")
                        
                        self.accountTypeNameChecked = AccountType.pilot
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
                        print("Passenger State : \(self.checkPassengerState)")
                        
                        self.accountTypeNameChecked = AccountType.passenger
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
                        print("Owner State : \(self.checkOwnerState)")
                        
                        self.accountTypeNameChecked = AccountType.owner
                }) {
                    HStack(alignment: .top, spacing: 10) {
                        Rectangle()
                            .fill(self.checkOwnerState ? Color.green : Color.red)
                            .frame(width:20, height:20, alignment: .center)
                            .cornerRadius(5)
                        
                        Text(AccountType.owner)
                    }
                }
                .foregroundColor(Color.white)
                
                
                // MARK: - Register button
                
                
                
                if isAddUserSuccess {
                    NavigationLink(destination: ProfileTemplateDelete()) {
//                        self.regitstrationApplyButton
                        regitstrationApplyButton.onTapGesture {
                            
                            let isAllTextFieldsEmpty = self.isTextFieldsEmpty(name: self.name,
                                                                              lastName: self.lastName,
                                                                              address: self.address)
                            
                            let isOneAccountTypeChecked = self.isAccountTypeChecked(pilotCheck: self.checkPilotState,
                                                                                    passengerCheck: self.checkPassengerState,
                                                                                    ownerCheck: self.checkOwnerState)
                            
                            if !isAllTextFieldsEmpty && isOneAccountTypeChecked {
                                
                                self.isAddUserSuccess = RegistrationViewController().addUser(
                                    phone: self.phoneNumber,
                                    name: self.name,
                                    lastName: self.lastName,
                                    accountType: self.accountTypeNameChecked,
                                    address: self.address)
                            }
                        }

                    }
                } else {
                    NavigationLink(destination: RegistrationView(phoneNumber: $phoneNumber, name: name, lastName: lastName, address: address, accountTypeNameChecked: accountTypeNameChecked)) {
//                        self.regitstrationApplyButton
                        regitstrationApplyButton.onTapGesture {
                            
                            let isAllTextFieldsEmpty = self.isTextFieldsEmpty(name: self.name,
                                                                              lastName: self.lastName,
                                                                              address: self.address)
                            
                            let isOneAccountTypeChecked = self.isAccountTypeChecked(pilotCheck: self.checkPilotState,
                                                                                    passengerCheck: self.checkPassengerState,
                                                                                    ownerCheck: self.checkOwnerState)
                            
                            if !isAllTextFieldsEmpty && isOneAccountTypeChecked {
                                
                                self.isAddUserSuccess = RegistrationViewController().addUser(
                                    phone: self.phoneNumber,
                                    name: self.name,
                                    lastName: self.lastName,
                                    accountType: self.accountTypeNameChecked,
                                    address: self.address)
                            }
                        }

                    }
                }
                
                
                
                
                
                
                
                
                
                
            }
            .background(Colors.bgColor)
            
            
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.bgColor)
        .modifier(DismissingKeyboard())
    }
    
    // MARK: - Validation
    
    func isTextFieldsEmpty(name: String, lastName: String, address: String) -> Bool {
        
        if (name == "" || lastName == "" || address == "") {
            return true
        }
        
        return false
    }
    
    func isAccountTypeChecked(pilotCheck: Bool, passengerCheck: Bool, ownerCheck: Bool) -> Bool {
        
        let accountTypeStates = [pilotCheck, passengerCheck, ownerCheck]
        
        if accountTypeStates.contains(true) {
            return true
        }
        
        return false
    }
}

struct RegistrationViewTitle: View {
    var body: some View {
        Text("Регистрация")
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .background(Colors.bgColor)
    }
}
