//
//  SFSafariViewControllerLink.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 18.01.24.
//

import SwiftUI

struct WebviewLinks: View {
    
    @State private var isPresentWebView = false
    
    var body: some View {
        
        VStack {
            
            Text("Webviews")
                .font(.title)
                .fontWeight(.light)
                .padding(.bottom, 5)
            
            Link("Safari", destination: URL(string: "https://duckduckgo.com")!)
                .accessibilityIdentifier("HomeScreen.openSafari")
                .padding(.bottom, 5)
            
            Button("WKWebView") {
                isPresentWebView = true
            }
            .accessibilityIdentifier("HomeScreen.openWKWebView")
            .padding(.bottom, 5)
            .sheet(isPresented: $isPresentWebView) {
                //            if #available(iOS 16, *) {
                //                NavigationStack {
                //                    WebView(url: URL(string: "https://duckduckgo.com")!)
                //                        .ignoresSafeArea()
                //                        .navigationTitle("WKWebView")
                //                        .navigationBarTitleDisplayMode(.inline)
                //                }
                //            } else {
                WebView(url: URL(string: "https://duckduckgo.com")!)
                    .ignoresSafeArea()
                    .navigationTitle("Website opened in WKWebView")
                    .navigationBarTitleDisplayMode(.inline)
            }
            //        }
            
            
            ////        if #available(iOS 16, *) {
            //            NavigationStack {
            //                NavigationLink("Open website in SFSafariViewController") {
            //                    SafariWebView(url: URL(string: "https://duckduckgo.com")!)
            //                        .ignoresSafeArea()
            //                        .navigationTitle("Website opened in SFSafariViewController")
            //                        .navigationBarTitleDisplayMode(.inline)
            //                        .padding(5)
            //                }
            //            }
            //        } else {
            NavigationLink("SFSafariViewController") {
                SafariWebView(url: URL(string: "https://duckduckgo.com")!)
                    .ignoresSafeArea()
                    .navigationTitle("Website opened in SFSafariViewController")
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(5)
            }
            //        }
            
            
        }
        .padding()
        .background(Color.gray.opacity(0.1)
        .ignoresSafeArea())
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(.gray, lineWidth: 1)
        )
    }
}

struct WebviewLinks_Previews: PreviewProvider {
    static var previews: some View {
        WebviewLinks()
    }
}
