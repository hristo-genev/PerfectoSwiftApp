//
//  Username.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 17.11.23.
//

import SwiftUI

struct PasswordFields: View {

    @EnvironmentObject var loginModel: LoginViewModel
    
    @State var showPassword: Bool = false
    
    var body: some View {
        HStack {
            Group {
                if showPassword {
                    TextField(
                        "LoginScreen.PasswordField.Title".localized,
                        text: $loginModel.password
                    )
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, 10)
                    .accessibilityIdentifier("LoginScreen.passwordTxt")
                } else {
                    SecureField(
                        "LoginScreen.PasswordField.Title".localized,
                        text: $loginModel.password
                    )
                    .padding(/*@START_MENU_TOKEN@*/.vertical, 5.0/*@END_MENU_TOKEN@*/)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("LoginScreen.password")
                    
                }
                
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                }
                .accessibilityIdentifier("LoginScreen.showPasswordBtn")
            }
        }
        
    
    }
}
