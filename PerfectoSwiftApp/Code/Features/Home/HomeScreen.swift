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
        NavigationView {
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
                    
                    NavigationLink(destination: WebviewScreen()) {
                        Text("Open a Webview")
                            .font(.title)
                            .fontWeight(.light)
                    }.accessibilityIdentifier("HomeScreen.openWebviewBtn")
                    .padding(.bottom, 5)
                        
                    NavigationLink(destination: MapScreen()) {
                        Text("Verify your location")
                            .font(.title)
                            .fontWeight(.light)
                    }.accessibilityIdentifier("HomeScreen.openLocationBtn")
                        .padding(.bottom, 5)
                    
                    NavigationLink(destination: ImageScannerScreen()) {
                        Text("Test image injection")
                            .font(.title)
                            .fontWeight(.light)
                    }.accessibilityIdentifier("HomeScreen.openImageInjectionBtn")
                    .padding(.bottom, 5)

                    NavigationLink(destination: ScrollScreen()) {
                        Text("Wanna swipe?")
                            .font(.title)
                            .fontWeight(.light)
                    }.accessibilityIdentifier("HomeScreen.openScrollBtn")

                }
                .padding(.top, 100)
                
                
                AppInfoScreen()
            }
            
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(isLoggedIn: .constant(true)).environmentObject(LoginViewModel())
    }
}
