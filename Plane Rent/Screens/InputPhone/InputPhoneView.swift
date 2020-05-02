//
//  InputPhoneView.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 29.04.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import SwiftUI
import UIKit


struct InputPhoneViewState {
    
    static var shared = InputPhoneViewState()
    var isAccounExist: Bool = false
}

struct InputPhoneView: View {
    
    @State var phoneNumber: String = "7"
    
    @State var isModal = false

        
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
                
                Button(action: {
                    self.isModal.toggle()
                    print("before tap")
                    
                    var result: Bool = false
                    
                    InputPhoneController().ifAccountExistLoginElseRegistration(
                        phone: self.phoneNumber,
                        completionBlock: { (result: Bool) -> Void in
                            print("result is: \(result)")
                    })
                    
                    print("after tap")
                }) {
                    Image("plane")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                }.sheet(isPresented: $isModal, content: {
                    
                    if InputPhoneViewState.shared.isAccounExist {
                        InputSmsView()
                    } else {
                        RegistrationView()
                    }
                })
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Colors.bgColor)
            .modifier(DismissingKeyboard())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InputPhoneView()
    }
}

struct PhoneNumberTextField : View {
    
    @Binding var phoneNumber: String
    
    var body: some View {
        return TextField("PhoneNumber", text: $phoneNumber)
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
