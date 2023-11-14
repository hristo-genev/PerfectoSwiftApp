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
    
    var body: some View {
        
        let username = viewModel.username.isEmpty ? "Guest" : viewModel.username
        let isGuest = viewModel.username == "Guest"
        
        VStack {
            Text("Hello \(username)")
                .font(.title)
                .padding(.bottom)
            Text("Welcome to the jungle baby!")
                .font(.body)
                .padding(.bottom)
    //        if viewModel.isBusy {
    //            ProgressView()
    //        } else {
    //            Text("Home Screen")
    //                .navigationTitle("Home")
    //                .toolbar {
    
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
                    
                    Button(
                        action: {
                            Task {}
                        },
                        label: {
                            Text("Open Webview")
                        }
                    ).accessibilityIdentifier("HomeScreen.OpenWebview")
                    
                    Button(
                        action: {
                            Task {}
                        },
                        label: {
                            Text("Verify your location")
                        }
                    ).accessibilityIdentifier("HomeScreen.OpenLocation")
                }
                
                HStack {
                    Button(
                        action: {
                            Task {}
                        },
                        label: {
                            Text("Test image injection")
                        }
                    ).accessibilityIdentifier("HomeScreen.OpenImageInjection")
                    
                    Button(
                        action: {
                            Task {}
                        },
                        label: {
                            Text("Wanna scroll?")
                        }
                    ).accessibilityIdentifier("HomeScreen.OpenScroll")
                }
                .padding(.top, 20)
            }
            .padding(.top, 100)
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(isLoggedIn: .constant(true)).environmentObject(LoginViewModel())
    }
}
