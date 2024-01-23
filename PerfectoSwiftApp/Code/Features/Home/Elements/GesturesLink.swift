//
//  MapLink.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 18.01.24.
//

import Foundation
import SwiftUI

struct GesturesLink: View {
    
    var body: some View {
        
        VStack {
            
            Text("Gestures")
                .font(.title)
                .fontWeight(.light)
                .padding(.bottom, 5)
            

            NavigationLink(destination: ScrollScreen()) {
                Text("Wanna swipe?")
            }.accessibilityIdentifier("HomeScreen.openScroll")
        
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

struct ScrollLink_Previews: PreviewProvider {
    static var previews: some View {
        GesturesLink()
    }
}
