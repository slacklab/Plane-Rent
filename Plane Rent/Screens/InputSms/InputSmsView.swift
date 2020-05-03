//
//  InputSmsView.swift
//  Plane Rent
//
//  Created by Ivan Sorokoletov on 02.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import SwiftUI

struct InputSmsView: View {
    
    @State private var action: Int? = 0
    
    @Binding var phoneNumber: String
    
    @State var generatedCode = String.random(length: 4)
    @State var inputedCode: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Введите код")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                
                Text(self.phoneNumber)
                TextField("Code from sms", text: $inputedCode) {
                    UIApplication.shared.endEditing()
                }
                .keyboardType(.phonePad)
                .frame(width: 250, height: 50, alignment: .center)
                .font(.title)
                
                Text("___________________________")
                    .frame(width: 250, alignment: .center)
                
                if (self.inputedCode == self.generatedCode) {
                    NavigationLink(destination: ProfileTemplateDelete()) {
                            CheckCodeButtonView()
                    }
                } else {
                    CheckCodeButtonView()
                }
                
            }.background(Colors.bgColor)
        }.onAppear {
            print(self.generatedCode)
            // TODO: - uncomment this
//            SmsService.send(phone: self.phoneNumber, message: self.generatedCode)
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.bgColor)
        .modifier(DismissingKeyboard())
    }
}

struct CheckCodeButtonView: View {
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
