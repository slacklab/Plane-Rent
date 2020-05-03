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
    
    @State var phoneNumber: String = "7"
    @State var isModal = false
    @State var stateExist = false
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Plane rent")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                
                TextField("", text: $phoneNumber) {
                    UIApplication.shared.endEditing()
                }
                .keyboardType(.phonePad)
                .frame(width: 250, height: 50, alignment: .center)
                .font(.title)
                
                Text("___________________________")
                    .frame(width: 250, alignment: .center)
                
                if InputPhoneController().isAccountExist(phone: self.phoneNumber) {
                    NavigationLink(destination: InputSmsView(phoneNumber: $phoneNumber, inputedCode: "")) {
                        CheckPhoneButtonView()
                    }
                } else {
                    NavigationLink(destination: RegistrationView(
                        phoneNumber: $phoneNumber,
                        name: "",
                        lastName: "",
                        address: "",
                        accountType: "")
                    ) {
                        CheckPhoneButtonView()
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Colors.bgColor)
            .modifier(DismissingKeyboard())
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
