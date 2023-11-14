//
//   LandingScreen.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 20.10.23.
//

import SwiftUI


struct LandingScreen: View {
    
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        
        if viewModel.isBusy {
            ProgressView()
        } else {
            
            VStack {
                
                Image("perfectoLogo")
                    .renderingMode(.original)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 100)
                    .padding(.top, 20)
                    .padding(.horizontal, 40)
                
                Image("technology")
                    .renderingMode(.original)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 100)
                    .padding(.top, 20)
                    .padding(.horizontal, 40)
//                    .position(y: 50)
                
                Spacer()
                
                Button() {
                    
                } label: {
                       
                }
                
                
                HStack {
                    Button("Register"){
                        
                    }
                    Button("Sign In Help"){
                        
                    }
                    
                    Button("Settings"){
                        
                    }
                }
                
                Text("ver 1.0")
            }

        }
    }
}


struct LandingScreen_Previews: PreviewProvider {
    static var previews: some View {

        LandingScreen().environmentObject(LoginViewModel())
    }
}
