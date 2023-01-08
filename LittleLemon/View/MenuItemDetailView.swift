//
//  MenuItemDetailView.swift
//  LittleLemon
//
//  Created by Akirah Dev on 08/01/23.
//  
//

import SwiftUI

struct MenuItemDetailView: View {
    var body: some View {
        VStack {
            Text("Food 5")
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
                Text("10,99")
            }
            .padding(.bottom)
            
            VStack {
                Text("Ordered")
                    .fontWeight(.bold)
                Text("1,000")
            }
            .padding(.bottom)
            
            VStack {
                Text("Ingredients")
                    .fontWeight(.bold)
                VStack {
                    Text("Spinach")
                    
                    Text("Broccolli")
                    
                    Text("Carrot")
                    
                    Text("Pasta")
                }
            }
            
            Spacer()
        }
    }
}

struct MenuItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailView()
    }
}
