//
//  Username.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 17.11.23.
//

import SwiftUI

struct LogoView: View {
    
    var body: some View {
        VStack {
            
            Image("perfectoLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
                .padding(.top, 20)

                Text("SwiftUI Demo App")
                    .font(.title)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
        }
    }
}
