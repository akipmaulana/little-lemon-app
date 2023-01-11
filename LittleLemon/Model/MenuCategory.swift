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

/*
 Id variable of type UUID with a getter method.
 Price variable of type Double with a getter method.
 Title variable of type String with a getter method.
 Menu category variable of type MenuCategory with a getter method.
 Orders count variable of type Int with getter and setter methods.
 Price variable of type Int with getter and setter methods.
 Ingredient variable of type Ingredient array with getter and setter methods.
 */

protocol Itemable: Identifiable {
    var price: Double { get }
    var title: String { get }
    var category: MenuCategory { get }
    var orders: Int { get }
    var ingredients: [Ingredient] { get }
}

struct MenuItem: Itemable {
    let price: Double = 3.92
    
    let orders: Int = 5

    let id = UUID()
    
    let category: MenuCategory
    
    let ingredients: [Ingredient]
    
    var title: String {
        category.rawValue
    }
}
