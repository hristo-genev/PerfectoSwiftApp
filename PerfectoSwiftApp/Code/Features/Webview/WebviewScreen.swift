//
//  WebviewScreen.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 16.01.24.
//

import SwiftUI

struct WebviewScreen: View {

    @State private var isPresentWebView = false

        
        var body: some View {
            Button("Open WebView") {
                isPresentWebView = true
            }
            .sheet(isPresented: $isPresentWebView) {
                if #available(iOS 16, *) {
                    NavigationStack {
                        WebView(url: URL(string: "https://duckduckgo.com")!)
                            .ignoresSafeArea()
                            .navigationTitle("Webview")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
        }
}


struct WeviewScreen_Previews: PreviewProvider {
    static var previews: some View {
        WebviewScreen()
    }
}
