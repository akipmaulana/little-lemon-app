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
