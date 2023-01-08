//
//  Filterable.swift
//  LittleLemon
//
//  Created by Akirah Dev on 08/01/23.
//  
//

import Foundation

protocol Selectable {
    var title: String { get }
}

enum FilterType: CaseIterable, Selectable {
    case food
    case drink
    case desert
    
    var title: String {
        switch self {
        case .food:
            return "Food"
        case .drink:
            return "Drink"
        case .desert:
            return "Desert"
        }
    }
}

enum SortType: CaseIterable, Selectable {
    case popular
    case price
    case ascending
    
    var title: String {
        switch self {
        case .popular:
            return "Most Popular"
        case .price:
            return "Price $-$$$"
        case .ascending:
            return "A-Z"
        }
    }
}
