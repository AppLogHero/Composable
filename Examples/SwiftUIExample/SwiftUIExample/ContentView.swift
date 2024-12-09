//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Julien Delferiere on 08/12/2024.
//

import SwiftUI
import Composable

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
