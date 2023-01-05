//
//  ContentView.swift
//  LittleLemon
//
//  Created by Akirah Dev on 05/01/23.
//  
//

import SwiftUI
import CoreUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(CoreUI().text)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
