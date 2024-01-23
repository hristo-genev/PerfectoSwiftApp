//
//  MapLink.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 18.01.24.
//

import Foundation


import SwiftUI

struct MapLink: View {
    
    var body: some View {
        
        VStack {
            
            Text("Location")
                .font(.title)
                .fontWeight(.light)
                .padding(.bottom, 5)
            
            NavigationLink(destination: MapScreen()) {
                VStack {
                    Text("Where am I?")
                    Image(systemName: "location.square")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .accessibilityIdentifier("HomeScreen.openLocation")
            
        }
        .padding()
        .background(Color.gray.opacity(0.1)
            .ignoresSafeArea())
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(.gray, lineWidth: 1)
        )
        Spacer()
    }
}

struct MapLink_Previews: PreviewProvider {
    static var previews: some View {
        MapLink()
    }
}
