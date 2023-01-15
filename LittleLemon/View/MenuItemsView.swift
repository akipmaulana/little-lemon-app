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
                ForEach(menu, id: \.id) { item in
                    NavigationLink(destination: MenuItemDetailView(item: item)) {
                        VStack {
                            Image("")
                                .resizable()
                                .background(Color.black)
                                .frame(height: 64)
                                .clipped()
                            
                            Text("\(item.title)")
                        }
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
                    viewModel.filterMenu()
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
    
    @Published private(set) var displayedFood: [MenuItem] = []
    @Published private(set) var displayedDrink: [MenuItem] = []
    @Published private(set) var displayedDesert: [MenuItem] = []
    @Published var selectedCategory: MenuCategory?
    @Published var selectedSort: SortType?
    
    func refreshLoadMenu() {
        displayedFood = MockData.foods
        displayedDrink = MockData.drinks
        displayedDesert = MockData.deserts
    }
    
    func sortMenu(data: [MenuItem], by sortType: SortType?) -> [MenuItem] {
        guard let sortType = sortType else {
            return data
        }
        
        switch sortType {
        case .ascending:
            return data.sorted(by: { $0.title < $1.title })
        case .popular:
            return data.sorted(by: { $0.orders > $1.orders })
        case .price:
            return data.sorted(by: { $0.price > $1.price })
        }
    }
    
    func filterMenu() {
        switch selectedCategory {
        case .some(.food):
            displayedFood = sortMenu(data: MockData.foods, by: selectedSort)
            displayedDrink = []
            displayedDesert = []
        case .some(.drink):
            displayedFood = []
            displayedDrink = sortMenu(data: MockData.drinks, by: selectedSort)
            displayedDesert = []
        case .some(.desert):
            displayedFood = []
            displayedDrink = []
            displayedDesert = sortMenu(data: MockData.deserts, by: selectedSort)
        default:
            displayedFood = sortMenu(data: MockData.foods, by: selectedSort)
            displayedDrink = sortMenu(data: MockData.drinks, by: selectedSort)
            displayedDesert = sortMenu(data: MockData.deserts, by: selectedSort)
            break
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: MenuViewModel())
    }
}
