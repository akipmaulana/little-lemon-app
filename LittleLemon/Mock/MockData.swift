//
//  MockData.swift
//  LittleLemon
//
//  Created by Akirah Dev on 15/01/23.
//  
//

import Foundation

struct MockData {
    static let foods: [MenuItem] = [
        MenuItem(
            title: "Food 1",
            price: 83,
            orders: 3,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Food 2",
            price: 43,
            orders: 2,
            category: .food,
            ingredients: [.pasta, .tomato]
        ),
        MenuItem(
            title: "Food 3",
            price: 54,
            orders: 1,
            category: .food,
            ingredients: [.carrot, .tomato]
        ),
        MenuItem(
            title: "Food 4",
            price: 12,
            orders: 1,
            category: .food,
            ingredients: [.spinach, .tomato]
        ),
        MenuItem(
            title: "Food 5",
            price: 32,
            orders: 5,
            category: .food,
            ingredients: [.spinach, .pasta, .tomato]
        ),
        MenuItem(
            title: "Food 6",
            price: 54,
            orders: 4,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Food 7",
            price: 86,
            orders: 3,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Food 8",
            price: 65,
            orders: 2,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Food 9",
            price: 79,
            orders: 3,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Food 10",
            price: 94,
            orders: 5,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Food 11",
            price: 12,
            orders: 3,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Food 12",
            price: 32,
            orders: 3,
            category: .food,
            ingredients: [.carrot, .pasta, .tomato]
        ),
    ]
    
    static let drinks: [MenuItem] = [
        MenuItem(
            title: "Drink 1",
            price: 12,
            orders: 3,
            category: .drink,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Drink 2",
            price: 43,
            orders: 3,
            category: .drink,
            ingredients: [.pasta, .tomato]
        ),
        MenuItem(
            title: "Drink 3",
            price: 51,
            orders: 2,
            category: .drink,
            ingredients: [.carrot, .tomato]
        ),
        MenuItem(
            title: "Drink 4",
            price: 37,
            orders: 2,
            category: .drink,
            ingredients: [.spinach, .tomato]
        ),
        MenuItem(
            title: "Drink 5",
            price: 32,
            orders: 5,
            category: .drink,
            ingredients: [.spinach, .pasta, .tomato]
        ),
        MenuItem(
            title: "Drink 6",
            price: 27,
            orders: 5,
            category: .drink,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Drink 7",
            price: 26,
            orders: 2,
            category: .drink,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Drink 8",
            price: 25,
            orders: 3,
            category: .drink,
            ingredients: [.carrot, .pasta, .tomato]
        ),
    ]
    
    static let deserts: [MenuItem] = [
        MenuItem(
            title: "Desert 1",
            price: 54,
            orders: 4,
            category: .desert,
            ingredients: [.carrot, .pasta, .tomato]
        ),
        MenuItem(
            title: "Desert 2",
            price: 61,
            orders: 5,
            category: .desert,
            ingredients: [.pasta, .tomato, .spinach]
        ),
        MenuItem(
            title: "Desert 3",
            price: 43,
            orders: 5,
            category: .desert,
            ingredients: [.carrot, .tomato]
        ),
        MenuItem(
            title: "Desert 4",
            price: 33,
            orders: 0,
            category: .desert,
            ingredients: [.spinach, .tomato]
        ),
    ]
}
