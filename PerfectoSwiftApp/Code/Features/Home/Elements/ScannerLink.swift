//
//  MapLink.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 18.01.24.
//

import Foundation
import SwiftUI

struct ScannerLink: View {
    
    var body: some View {
        
        VStack {
            
            Text("Scanner")
                .font(.title)
                .fontWeight(.light)
                .padding(.bottom, 5)
            
            NavigationLink(destination: ImageScannerScreen()) {
                VStack {
                    Text("Scan image")
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 30, height: 30)
                    }
            }
            
            .accessibilityIdentifier("HomeScreen.openImageInjection")
            .padding(.bottom, 5)
        }
        .padding()
        .background(
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
        )
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(.gray, lineWidth: 1)
        )
    }
}

struct ScannerLink_Previews: PreviewProvider {
    static var previews: some View {
        ScannerLink()
    }
}
