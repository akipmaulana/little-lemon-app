//
//  MenuItemDetailView.swift
//  LittleLemon
//
//  Created by Akirah Dev on 08/01/23.
//  
//

import SwiftUI

struct MenuItemDetailView: View {
    
    let item: any Itemable
    
    var body: some View {
        VStack {
            Text(item.title)
                .font(.largeTitle)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.horizontal)
            
            Image("little-lemon-logo")
                .resizable()
                .frame(width: 200, height: 300)
                .scaledToFit()
                .padding(.bottom)
            
            VStack {
                Text("Price")
                    .fontWeight(.bold)
                Text(String(format: "$%.2f", item.price))
            }
            .padding(.bottom)
            
            VStack {
                Text("Ordered")
                    .fontWeight(.bold)
                Text("\(item.orders) times")
            }
            .padding(.bottom)
            
            VStack {
                Text("Ingredients")
                    .fontWeight(.bold)
                VStack {
                    ForEach(item.ingredients) { ingredient in
                        Text(ingredient.rawValue)
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct MenuItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailView(item: MenuItem(title: "Foody", price: 23, orders: 4, category: .food, ingredients: [.tomato, .pasta, .carrot, .spinach]))
    }
}
