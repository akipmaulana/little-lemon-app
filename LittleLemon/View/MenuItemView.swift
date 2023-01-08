//
//  MenuItemView.swift
//  LittleLemon
//
//  Created by Akirah Dev on 08/01/23.
//  
//

import SwiftUI

struct ThematicSkeletonView: View {
    
    let type: FilterType
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(type.title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            LazyVGrid(
                columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                ]
            ) {
                ForEach((0..<12), id: \.self) { index in
                    VStack {
                        Image("")
                            .resizable()
                            .background(Color.black)
                            .frame(height: 64)
                            .clipped()
                        
                        Text("\(type.title) \(index + 1)")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MenuItemsView: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                ForEach(FilterType.allCases, id: \.hashValue) {
                    
                    ThematicSkeletonView(type: $0)
                }
            }
            .popover(isPresented: $isPresented, content: {
                MenuItemsOptionView()
            })
            .navigationBarTitle(
                Text("Menu")
                    .font(.subheadline),
                displayMode: .large
            )
            .toolbar {
                Button(action: {
                    isPresented.toggle()
                }) {
                    Image(systemName: "slider.horizontal.3")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
