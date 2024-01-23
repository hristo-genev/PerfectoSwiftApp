//
//  AppInfoScreen.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 19.01.24.
//

import SwiftUI

struct AppInfoScreen: View {
    
    var body: some View {
        VStack {
//            Text("Build Info:")
//                .font(.title)
            Text("App version: 1.0.20240119")
            Text("XCode version: 15.0")
            Text("Minimum iOS version: 15.0")
            Text("Support: hgenev@perforce.com")
        }
        .padding()
//        .background(
//            Color.gray.opacity(0.1)
//                .ignoresSafeArea()
//        )
//        .cornerRadius(10)
//        .overlay(RoundedRectangle(cornerRadius: 10)
//            .stroke(.gray, lineWidth: 1)
//        )
    }
}

struct AppInfoScreen_Previews: PreviewProvider {
    static var previews: some View {

        AppInfoScreen()
    }
}
