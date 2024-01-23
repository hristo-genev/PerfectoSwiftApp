//
//  Username.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 17.11.23.
//

import SwiftUI

struct UsernameTextField: View {

    @EnvironmentObject var loginModel: LoginViewModel

    var body: some View {
        TextField(
            "LoginScreen.UsernameField.Title".localized,
            text: $loginModel.username
        )
        .autocapitalization(.none)
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .textFieldStyle(.roundedBorder)
        .padding(.vertical, 5.0)
    
    }
}

