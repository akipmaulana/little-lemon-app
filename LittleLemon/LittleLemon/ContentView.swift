//
//  ContentView.swift
//  LittleLemon
//
//  Created by Akirah Dev on 05/01/23.
//  
//

import SwiftUI
import CoreUI

struct CarouselSlideDefault: CarouselSlide {
    let imageUrl: String
    let placeholderImageUrl: String
}

struct ContentView: View {
    var body: some View {
        CarouselDirector(
            builderType: .alpha
        )
        .setSlides(
            data: [
                CarouselSlideDefault(imageUrl: "", placeholderImageUrl: ""),
                CarouselSlideDefault(imageUrl: "", placeholderImageUrl: ""),
                CarouselSlideDefault(imageUrl: "", placeholderImageUrl: ""),
                CarouselSlideDefault(imageUrl: "", placeholderImageUrl: ""),
            ]
        )
        .body
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
