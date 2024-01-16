//
//  Username.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 17.11.23.
//

import SwiftUI

struct LogoView: View {
    
    var body: some View {

        Text("SwiftUI Demo")
            .font(.title)
        
        Image("perfectoLogo")
            .renderingMode(.original)
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .padding(.bottom, 60.0)
            .padding(.top, 50.0)
    }
}
