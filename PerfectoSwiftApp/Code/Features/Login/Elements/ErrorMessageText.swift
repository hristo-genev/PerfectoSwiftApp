//
//  ErrorMessageText.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 17.11.23.
//

import SwiftUI

struct ErrorMessageText: View {
    
    @Binding var loginErrorMessage: String
    @Binding var isErrorHidden: Bool
    
    var body: some View {
        Text(loginErrorMessage)
            .font(.footnote)
            .foregroundColor(Color.red)
            .frame(width: .infinity, height: 20)
            .opacity(isErrorHidden ? 1 : 0)
            .accessibilityIdentifier("LoginScreen.errorMsg")
    }
}
