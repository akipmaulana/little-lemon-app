//
//  File.swift
//  
//
//  Created by Akirah Dev on 05/01/23.
//  
//

import SwiftUI

struct CircleIndicatorView: View {
    
    let selected: Bool
    
    var body: some View {
        Circle()
            .fill(selected ? Color.purple : Color.purple.opacity(0.5))
            .frame(width: 20, height: 20)
    }
}

struct SquareIndicatorView: View {
    
    let selected: Bool
    
    var body: some View {
        Rectangle()
            .fill(selected ? Color.purple : Color.purple.opacity(0.5))
            .frame(width: 20, height: 20)
    }
}

struct LineIndicatorView: View {
    
    let selected: Bool
    
    var body: some View {
        Rectangle()
            .fill(selected ? Color.purple : Color.purple.opacity(0.5))
            .frame(width: 30, height: 5)
    }
}

struct LongLineIndicatorView: View {
    
    let selected: Bool
    
    var body: some View {
        Rectangle()
            .fill(selected ? Color.purple : Color.purple.opacity(0.5))
            .frame(height: 5)
    }
}

struct GroupIndicatorView: View {
    
    let totalSlide: Int
    @Binding var index: Int
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach((0..<totalSlide), id: \.self) { index in
                CircleIndicatorView(selected: index == self.index)
            }
        }
    }
}

struct SliderView: View {
    
    let totalSlide: Int
    @Binding var index: Int
    
    var body: some View {
        TabView(selection: $index) {
            ForEach((0..<totalSlide), id: \.self) { index in
                CardView()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color.blue)
        .frame(height: 200)
        .padding()
    }
}

public struct CarouselView: View {
    
    let spec: CarouselSpec
    
    @State private var index = 0
    
    public var body: some View {
        VStack{
            
            SliderView(totalSlide: spec.totalSlides, index: $index)
            
            GroupIndicatorView(totalSlide: spec.totalSlides, index: $index)
        }
    }
}

private struct CardView: View {
    var body: some View {
        Rectangle()
            .fill(Color.yellow)
            .border(Color.blue)

    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselDirector(
            type: .beta
        )
        .slides(
            data: [
                CarouselSlideMock(imageUrl: "", placeholderImageUrl: ""),
                CarouselSlideMock(imageUrl: "", placeholderImageUrl: ""),
                CarouselSlideMock(imageUrl: "", placeholderImageUrl: ""),
                CarouselSlideMock(imageUrl: "", placeholderImageUrl: ""),
            ]
        )
        .view
    }
}

private struct CarouselSlideMock: CarouselSlide {
    let imageUrl: String
    let placeholderImageUrl: String
}
