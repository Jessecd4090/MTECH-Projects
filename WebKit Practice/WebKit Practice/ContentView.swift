//
//  ContentView.swift
//  WebKit Practice
//
//  Created by Jestin Dorius on 6/25/25.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(colors: [.indigo, .pink, .blue, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                    NavigationLink("Enter") {
                        WebPageView()
                    }
                    .buttonStyle(.borderedProminent)
                
            }
            .navigationTitle(Text("WebApp"))
                
            
        }
    }
}

struct WebPageView: View {
    @State private var toggle = true
    @State private var page = WebPage()
    let macURL = URL(string: "https://www.apple.com/mac/")
    let devURL = URL(string: "https://developer.apple.com/design/human-interface-guidelines")
    var body: some View {
        VStack {
            WebView(page)
                .padding(.top, 1)
                .navigationTitle(page.title)
                .toolbar(content: {
                        Button(toggle ? "Macs" : "Developing") {
                            toggle.toggle()
                            page.load(toggle ? URLRequest(url: (devURL!)) : URLRequest(url: macURL!))
                        }
                })
            if let url = page.url {
                Text("\(url)")
            }
        }
        .onAppear {
            page.load(URLRequest(url: toggle ? devURL! : macURL!))
        }
    }
}
#Preview {
    ContentView()
}
