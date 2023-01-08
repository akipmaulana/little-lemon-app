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

enum SortType: String, CaseIterable, Selectable {
    case popular = "Most Popular"
    case price = "Price $-$$$"
    case ascending = "A-Z"
    
    var title: String {
        rawValue
    }
}
