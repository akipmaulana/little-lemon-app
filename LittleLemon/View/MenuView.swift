//
//  MenuItemView.swift
//  LittleLemon
//
//  Created by Akirah Dev on 08/01/23.
//  
//

import SwiftUI

struct ThematicSkeletonView: View {
    
    let type: MenuCategory
    let menu: [any Itemable]
    
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
                ForEach((0..<menu.count), id: \.self) { index in
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
            .padding()
        }
    }
}

struct MenuView: View {
    
    @State private var isPresented: Bool = false
    @ObservedObject var viewModel: MenuViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ThematicSkeletonView(type: .food, menu: viewModel.displayedFood)
                
                ThematicSkeletonView(type: .drink, menu: viewModel.displayedDrink)
                
                ThematicSkeletonView(type: .desert, menu: viewModel.displayedDesert)
            }
            .onAppear {
                viewModel.refreshLoadMenu()
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

final class MenuViewModel: ObservableObject {
    
    let foods: [MenuItem] = [
        MenuItem(category: .food,
                 ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.pasta, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.carrot, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.spinach, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.spinach, .pasta, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .food,
                 ingredients: [.carrot, .pasta, .tomato]),
    ]
    
    let drinks: [MenuItem] = [
        MenuItem(category: .drink, ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .drink, ingredients: [.pasta, .tomato]),
        MenuItem(category: .drink, ingredients: [.carrot, .tomato]),
        MenuItem(category: .drink, ingredients: [.spinach, .tomato]),
        MenuItem(category: .drink, ingredients: [.spinach, .pasta, .tomato]),
        MenuItem(category: .drink, ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .drink, ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .drink, ingredients: [.carrot, .pasta, .tomato])
    ]
    
    let deserts: [MenuItem] = [
        MenuItem(category: .desert, ingredients: [.carrot, .pasta, .tomato]),
        MenuItem(category: .desert, ingredients: [.pasta, .tomato]),
        MenuItem(category: .desert, ingredients: [.carrot, .tomato]),
        MenuItem(category: .desert, ingredients: [.spinach, .tomato]),
    ]
    
    @Published private(set) var displayedFood: [MenuItem] = []
    @Published private(set) var displayedDrink: [MenuItem] = []
    @Published private(set) var displayedDesert: [MenuItem] = []
    
    func refreshLoadMenu() {
        displayedFood = foods
        displayedDrink = drinks
        displayedDesert = deserts
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: MenuViewModel())
    }
}
