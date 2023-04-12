//
//  ContentView.swift
//  MoodMapper
//
//  Created by Isaad Khan on 2023-04-06.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
