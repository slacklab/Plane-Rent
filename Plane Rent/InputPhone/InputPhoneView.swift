//
//  InputPhoneView.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 29.04.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import SwiftUI

struct InputPhoneView: View {
    
    @State var phoneNumber: String = "7"
    
    var body: some View {
        
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
                print("button pressed")
                print(self.phoneNumber)
//                print(Requests().userLoginCheck(phone: self.phoneNumber))
                
                var result: Bool = false
                Requests().userLoginCheck(
                    phone: self.phoneNumber,
                    finished: {(result: Bool) -> Void in print(result)})
                
//                foo(username.text, password: password.text, finished: {(result:Bool) -> Void in
//                        println("result is: \(result)")
//                })
                
            }) {
                Image("plane")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            }
        }
        .padding()
        .modifier(DismissingKeyboard())
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
