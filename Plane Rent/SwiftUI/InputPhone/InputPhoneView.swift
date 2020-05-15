//
//  InputPhoneView.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 29.04.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import SwiftUI
import UIKit

struct InputPhoneView: View {
    
    @State var phoneNumber: String = ""
    @State var isModal = false
    @State var stateExist = false
    
    @State var mockStartPhone: String = "+7"
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                
                VStack(alignment: .center) {
                                        
                    Text("Plane rent")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        
                    HStack(alignment: .bottom, spacing: 20) {
                        
                        TextField("+7", text: $mockStartPhone)
                            .font(.title)
                            .disabled(true)
                            .frame(width: 40, height: 50, alignment: .bottom)
                        
                        TextField("", text: $phoneNumber) {
                            UIApplication.shared.endEditing()
                        }
                        .keyboardType(.phonePad)
                        .frame(width: 250, height: 50, alignment: .bottom)
                        .font(.title)
                        
                    }
                    
                    Divider()
                    
                    if InputPhoneController().isAccountExist(phone: self.phoneNumber) {
                        NavigationLink(destination: InputSmsView(phoneNumber: $phoneNumber, inputedCode: "")) {
                            CheckPhoneButtonView()
                            .padding(100)
                        }
                    } else {
                        NavigationLink(destination: RegistrationView(
                            phoneNumber: $phoneNumber,
                            name: "",
                            lastName: "",
                            address: "",
                            accountTypeNameChecked: "")
                        ) {
                            CheckPhoneButtonView()
                            .padding(100)
                        }
                    }
                }
                .padding(300)
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .modifier(DismissingKeyboard())
                .navigationBarTitle("Вход")
            }
        }
    }
}

struct PhoneNumberTextField : View {
    
    @Binding var phoneNumber: String
    
    var body: some View {
        return TextField("PhoneNumber", text: $phoneNumber)
    }
}

struct CheckPhoneButtonView: View {
    var body: some View {
        Image("plane")
            .renderingMode(.original)
            .resizable()
            .frame(width: 50, height: 50)
            .aspectRatio(contentMode: .fill)
            .clipped()
    }
}



//                if self.isAccounExist == false {
//                    NavigationLink(destination: InputSmsView()) {
//                        Image("plane")
//                            .renderingMode(.original)
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                            .aspectRatio(contentMode: .fill)
//                            .clipped()
//
//                    }
//                } else {
//                    NavigationLink(destination: RegistrationView()) {
//                        Image("plane")
//                            .renderingMode(.original)
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                            .aspectRatio(contentMode: .fill)
//                            .clipped()
//                    }
//                }

//                NavigationLink(destination: InputSmsView()) {
//                    Image("plane")
//                        .renderingMode(.original)
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .aspectRatio(contentMode: .fill)
//                        .clipped()
//                }


//                Button(action: {
//                    self.isModal.toggle()
//                    print("before tap")
//
//                    print("after tap")
//                }) {
//                    Image("plane")
//                        .renderingMode(.original)
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .aspectRatio(contentMode: .fill)
//                        .clipped()
//                }
//                .sheet(isPresented: $isModal, content: {
//                    if InputPhoneController().isAccountExist(phone: self.phoneNumber) {
//                        InputSmsView(phoneNumber: self.$phoneNumber, inputedCode: "")
//                    } else {
//                        RegistrationView()
//                    }
//                })
