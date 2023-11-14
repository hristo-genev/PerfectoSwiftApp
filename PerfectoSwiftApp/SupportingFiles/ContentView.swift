//
//  ContentView.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 13.10.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LoginViewModel()
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            if isLoggedIn {
                HomeScreen(isLoggedIn: $isLoggedIn)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .leading))
            } else {
                LoginScreen(isLoggedIn: $isLoggedIn)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .leading))
            }
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LoginViewModel())
    }
}
