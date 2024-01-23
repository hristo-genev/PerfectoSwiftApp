//
//  AppInfo.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 16.01.24.
//

import SwiftUI

struct AppInfoLink: View {
    @State private var buildInfoClicked = false
    
    var body: some View {
        
        VStack {
            
//            NavigationView {
                NavigationLink(destination: AppInfoScreen()) {
                    Text("Build Info")
                }
                .accessibilityIdentifier("openAppInfo")
                .padding(.bottom, 5)
//            }
            
        }
    }
}

struct AppInfoLink_Previews: PreviewProvider {
    static var previews: some View {

        AppInfoLink()
    }
}
