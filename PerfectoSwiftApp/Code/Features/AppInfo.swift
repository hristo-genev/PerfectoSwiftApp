//
//  AppInfo.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 16.01.24.
//

import SwiftUI

struct AppInfoScreen: View {
    
    var body: some View {
        
        VStack {
            Spacer()
                Text("ver. 1.0, built with XCode 15.0, hgenev@perforce.com")
                    .font(.body)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
        }
    }
}
