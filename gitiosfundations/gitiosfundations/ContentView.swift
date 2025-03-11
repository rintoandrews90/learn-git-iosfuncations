//
//  ContentView.swift
//  gitiosfundations
//
//  Created by Rinto Andrews on 11/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
#if DEBUG
            Text("**Base URL**: \(API.baseURL)")
            Text("**API key**: \(API.key)")
#endif
        }
    }
}
#Preview {
    ContentView()
}


struct API {
    static var baseURL: URL {
        URL(string: value(for: "API_BASE_URL"))!
    }

    static var key: String {
        value(for: "API_KEY")
    }
}

private extension API {
    static func value(for key: String) -> String {
        let object = Bundle.main.object(forInfoDictionaryKey: key)
        guard let value = object as? String else {
            fatalError("The \(key) key is missing. Read the Config.README file")
        }
        return value
    }
}
