//
//  HomeScreen.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 18.10.23.
//

import SwiftUI

struct HomeScreen: View {
    
    @Binding var isLoggedIn: Bool
    @EnvironmentObject var viewModel: LoginViewModel
    @State private var isPresentWebView = false
    
    var body: some View {
        
        let username = viewModel.username.isEmpty ? "Guest" : viewModel.username
        
        NavigationView {
            VStack {
                Text("Hello \(username)")
                    .font(.title)
                    .padding(.bottom)
                Text("Welcome to the jungle baby!")
                    .font(.body)
                    .padding(.bottom)
                
                VStack {
                    Button(
                        action: {
                            Task {
                                await viewModel.signout { result in
                                    switch result {
                                    case .success(true):
                                        isLoggedIn = false
                                        
                                        print("Successfully logged in")
                                    case .failure(let error):
                                        isLoggedIn = true
                                        
                                        print("Failed loggin in: \(error)")
                                    case .success(false):
                                        isLoggedIn = true
                                        
                                        print("Failed loggin in")
                                    }
                                }
                            }
                        },
                        label: {
                            Text("Log out")
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                    )
                }
                
                VStack {
                    HStack {
                        WebviewLinks()
                        MapLink()
                    }
                    
                    HStack {
                        ScannerLink()
                        GesturesLink()
                    }

                }
                .padding(.top, 60)
                .padding(10)
                
                Spacer()
                
                AppInfoLink()
            }
            
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(isLoggedIn: .constant(true)).environmentObject(LoginViewModel())
    }
}
