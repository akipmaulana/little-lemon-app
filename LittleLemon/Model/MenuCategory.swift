//
//  MenuCategory.swift
//  LittleLemon
//
//  Created by Akirah Dev on 08/01/23.
//  
//

import Foundation

enum MenuCategory: String, CaseIterable, Selectable {
    case food = "Food"
    case drink = "Drink"
    case desert = "Desert"
    
    var title: String {
        rawValue
    }
}

protocol Itemable: Identifiable {
    var price: Double { get }
    var title: String { get }
    var category: MenuCategory { get }
    var orders: Int { get }
    var ingredients: [Ingredient] { get }
}

struct MenuItem: Itemable {
    let price: Double
    
    var orders: Int = 0

    let id = UUID()
    
    let category: MenuCategory
    
    let ingredients: [Ingredient]
    
    var title: String {
        category.rawValue
    }
}
