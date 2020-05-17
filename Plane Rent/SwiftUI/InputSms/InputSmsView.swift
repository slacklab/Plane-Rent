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
            
            ZStack {
                VStack(alignment: .center) {
                    Text("Введите код")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .padding(.top, 150)
                    
                    Text(self.phoneNumber.startSym("+7"))
                    
                    TextField("Код из смс", text: $inputedCode) {
                        UIApplication.shared.endEditing()
                    }
                    .keyboardType(.phonePad)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    
                    Divider()
                    
                    if (self.inputedCode == self.generatedCode) {
                        NavigationLink(destination: SelectAirTypeView()) {
                            CheckCodeButtonView()
                        }
                    } else {
                        CheckCodeButtonView()
                    }
                    
                }
            }.onAppear {
                print(self.generatedCode)
//                SmsService.send(phone: self.phoneNumber.startSym("7"), message:  self.generatedCode)
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .modifier(DismissingKeyboard())
        }
        
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
    }
}
