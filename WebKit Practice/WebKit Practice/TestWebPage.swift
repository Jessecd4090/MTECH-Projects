//
//  TestWebPage.swift
//  WebKit Practice
//
//  Created by Jestin Dorius on 6/25/25.
//

import SwiftUI
import WebKit

struct TestWebPage: View {
    let url = URL(string: "https://developer.apple.com/design/human-interface-guidelines")
    var body: some View {
        WebView(url: url)
    }
}

#Preview {
    TestWebPage()
}
