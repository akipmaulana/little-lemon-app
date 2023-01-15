//
//  Ingredient.swift
//  LittleLemon
//
//  Created by Akirah Dev on 08/01/23.
//  
//

import Foundation

enum Ingredient: String, CaseIterable, Identifiable {
    var id: UUID { UUID() }
    case spinach = "Spinach"
    case broccoli = "Brocolli"
    case carrot = "Carrot"
    case pasta = "Pasta"
    case tomato = "Tomato"
}
