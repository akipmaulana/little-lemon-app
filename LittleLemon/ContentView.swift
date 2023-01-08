//
//  ContentView.swift
//  LittleLemon
//
//  Created by Akirah Dev on 07/01/23.
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MenuItemsOptionView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ThematicSkeletonView: View {
    
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
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
                        
                        Text("\(title) \(index + 1)")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MenuListScreen: View {
    var body: some View {
        ScrollView {
            ThematicSkeletonView(title: "Food")
            
            ThematicSkeletonView(title: "Drink")
            
            ThematicSkeletonView(title: "Desert")
        }
        .navigationBarTitle(
            Text("Menu")
                .font(.subheadline),
            displayMode: .large
        )
        .toolbar {
            Button(action: {}) {
                Image(systemName: "slider.horizontal.3")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
        }
    }
}


struct MenuItemsOptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            List {
                Section("Selected Categories") {
                    Text("Food")
                    
                    Text("Drink")
                    
                    Text("Desert")
                }
                
                Section("Sort By") {
                    Text("Most Popular")
                    
                    Text("Price $-$$$")
                    
                    Text("A-Z")
                }
                
            }
            .listStyle(.grouped)
        }
        .navigationBarTitle(
            Text("Filter")
                .font(.subheadline),
            displayMode: .large
        )
        .toolbar {
            Button("Done") {
                
            }
        }
    }
}
