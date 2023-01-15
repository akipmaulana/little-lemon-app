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
    
    @Binding private var selectedCategory: MenuCategory?
    @Binding private var selectedSort: SortType?
    
    private var onTapDone: (() -> Void)?
    
    init(
        selectedCategory: Binding<MenuCategory?>,
        selectedSort: Binding<SortType?>,
        _ onTapDone: @escaping () -> Void
    ) {
        self._selectedCategory = selectedCategory
        self._selectedSort = selectedSort
        self.onTapDone = onTapDone
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                List {
                    Section("Selected Categories") {
                        ForEach(MenuCategory.allCases, id: \.hashValue) { menu in
                            
                            HStack {
                                Text(menu.title)
                                
                                Spacer()
                                
                                if let selectedCategory = selectedCategory, selectedCategory == menu {
                                    Image(systemName: "checkmark")
                                }
                            }
                            .onTapGesture {
                                if menu == .some(selectedCategory) {
                                    selectedCategory = nil
                                } else {
                                    selectedCategory = menu
                                }
                            }
                        }
                    }
                    
                    Section("Sort By") {
                        ForEach(SortType.allCases, id: \.hashValue) { sort in
                            HStack {
                                Text(sort.title)
                                
                                Spacer()
                                
                                if let selectedSort = selectedSort, selectedSort == sort {
                                    Image(systemName: "checkmark")
                                }
                            }
                            .onTapGesture {
                                if sort == .some(selectedSort) {
                                    selectedSort = nil
                                } else {
                                    selectedSort = sort
                                }
                            }
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
                    onTapDone?()
                }
            }
        }
    }
}
