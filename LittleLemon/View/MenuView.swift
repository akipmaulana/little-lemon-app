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
                MenuItemsOptionView(
                    selectedCategory: $viewModel.selectedCategory,
                    selectedSort: $viewModel.selectedSort
                ) {
                    viewModel.filterSortMenu()
                }
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
        MenuItem(
            price: 83,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 43,
            category: .food,
            ingredients: [.pasta, .tomato]
        ),
        MenuItem(
            price: 54,
            category: .food,
            ingredients: [.carrot, .tomato]
        ),
        MenuItem(
            price: 12,
            category: .food,
            ingredients: [.spinach, .tomato]
        ),
        MenuItem(
            price: 32,
            category: .food,
            ingredients: [.spinach, .pasta, .tomato]
        ),
        MenuItem(
            price: 54,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 86,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 65,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 79,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 94,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 12,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 32,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
    ]
    
    let drinks: [MenuItem] = [
        MenuItem(
            price: 12,
            category: .drink,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 43,
            category: .drink,
            ingredients: [.pasta, .tomato]
        ),
        MenuItem(
            price: 51,
            category: .drink,
            ingredients: [.carrot, .tomato]
        ),
        MenuItem(
            price: 37,
            category: .drink,
            ingredients: [.spinach, .tomato]
        ),
        MenuItem(
            price: 32,
            category: .drink,
            ingredients: [.spinach, .pasta, .tomato]
        ),
        MenuItem(
            price: 27,
            category: .drink,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 26,
            category: .drink,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 25,
            category: .drink,
            ingredients: [.carrot, .pasta, .tomato]
        ),
    ]
    
    let deserts: [MenuItem] = [
        MenuItem(
            price: 54,
            category: .desert,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            price: 61,
            category: .desert,
            ingredients: [.pasta, .tomato, .spinach]
        ),
        MenuItem(
            price: 43,
            category: .desert,
            ingredients: [.carrot, .tomato]
        ),
        MenuItem(
            price: 33,
            category: .desert,
            ingredients: [.spinach, .tomato]
        ),
    ]
    
    @Published private(set) var displayedFood: [MenuItem] = []
    @Published private(set) var displayedDrink: [MenuItem] = []
    @Published private(set) var displayedDesert: [MenuItem] = []
    @Published var selectedCategory: MenuCategory?
    @Published var selectedSort: SortType?
    
    func refreshLoadMenu() {
        displayedFood = foods
        displayedDrink = drinks
        displayedDesert = deserts
    }
    
    func filterSortMenu() {
        switch selectedCategory {
        case .some(.food):
            displayedFood = foods
            displayedDrink = []
            displayedDesert = []
        case .some(.drink):
            displayedFood = []
            displayedDrink = drinks
            displayedDesert = []
        case .some(.desert):
            displayedFood = []
            displayedDrink = []
            displayedDesert = deserts
        default:
            break
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: MenuViewModel())
    }
}
