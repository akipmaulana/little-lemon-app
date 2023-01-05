//
//  File.swift
//  
//
//  Created by Akirah Dev on 05/01/23.
//  
//

import SwiftUI

public struct CustomCarouselView: View {
    
    let spec: CarouselSpec
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Carousel \(spec.title)")
        }
        .padding()
    }
}
