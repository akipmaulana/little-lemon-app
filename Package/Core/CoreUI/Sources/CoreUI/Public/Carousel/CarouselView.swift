//
//  File.swift
//  
//
//  Created by Akirah Dev on 05/01/23.
//  
//

import SwiftUI

struct CarouselView: View {
    
    @State private var index = 0
    
    var body: some View {
        VStack{
            
            TabView(selection: $index) {
                ForEach((0..<3), id: \.self) { index in
                    CardView()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .background(Color.blue)
            .frame(height: 200)
            .padding()
            
            HStack(spacing: 4) {
                ForEach((0..<3), id: \.self) { index in
                    Circle()
                        .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                        .frame(width: 20, height: 20)

                }
            }
            
//
//            HStack(spacing: 2) {
//                ForEach((0..<3), id: \.self) { index in
//                    Rectangle()
//                        .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
//                        .frame(width: 20, height: 20)
//
//                }
//            }
//            .padding()
//
//            HStack(spacing: 2) {
//                ForEach((0..<3), id: \.self) { index in
//                    Rectangle()
//                        .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
//                        .frame(width: 30, height: 5)
//
//                }
//            }
//            .padding()
//
//            HStack(spacing: 2) {
//                ForEach((0..<3), id: \.self) { index in
//                    Rectangle()
//                        .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
//                        .frame(height: 5)
//                }
//            }
//            .padding()
        }
    }
}

private struct CalendarView: View {
    var body: some View {
        Image(systemName: "calendar")
            .resizable()
            .frame(width: 50, height: 50)
            .padding()
            .background(Color.red)
            .cornerRadius(10)
            .foregroundColor(.white)
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
        CarouselView()
    }
}
