//
//  MenuItemsOptionView.swift
//  LittleLemon
//
//  Created by Akirah Dev on 08/01/23.
//  
//

import SwiftUI

struct MenuItemsOptionView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                List {
                    Section("Selected Categories") {
                        ForEach(FilterType.allCases, id: \.hashValue) {
                            Text($0.title)
                        }
                    }
                    
                    Section("Sort By") {
                        ForEach(SortType.allCases, id: \.hashValue) {
                            Text($0.title)
                        }
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
                    dismiss()
                }
            }
        }
    }
}

struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView()
    }
}
