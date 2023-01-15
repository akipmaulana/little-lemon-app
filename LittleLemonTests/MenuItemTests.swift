//
//  MenuItemTests.swift
//  LittleLemonTests
//
//  Created by Akirah Dev on 15/01/23.
//  
//

import XCTest
@testable import LittleLemon

extension MenuItem: Equatable {
    public static func ==(lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.title == rhs.title
    }
}

final class MenuItemTests: XCTestCase {
    func testMenuItem_whenNoFilter_shouldDisplayAll() {
        let sut: MenuViewModel = MenuViewModel()
        
        sut.filterMenu()
        
        XCTAssertEqual(sut.displayedFood, MockData.foods)
        XCTAssertEqual(sut.displayedDrink, MockData.drinks)
        XCTAssertEqual(sut.displayedDesert, MockData.deserts)
    }
    
    func testMenuItem_whenFilterFood_shouldDisplayFood() {
        let sut: MenuViewModel = MenuViewModel()
        
        sut.selectedCategory = .food
        sut.filterMenu()
        
        XCTAssertEqual(sut.displayedFood, MockData.foods)
        XCTAssertEqual(sut.displayedDrink, [])
        XCTAssertEqual(sut.displayedDesert, [])
    }
    
    func testMenuItem_whenFilterDrink_shouldDisplayDrink() {
        let sut: MenuViewModel = MenuViewModel()
        
        sut.selectedCategory = .drink
        sut.filterMenu()
        
        XCTAssertEqual(sut.displayedFood, [])
        XCTAssertEqual(sut.displayedDrink, MockData.drinks)
        XCTAssertEqual(sut.displayedDesert, [])
    }
    
    func testMenuItem_whenFilterDesert_shouldDisplayDesert() {
        let sut: MenuViewModel = MenuViewModel()
        
        sut.selectedCategory = .desert
        sut.filterMenu()
        
        XCTAssertEqual(sut.displayedFood, [])
        XCTAssertEqual(sut.displayedDrink, [])
        XCTAssertEqual(sut.displayedDesert, MockData.deserts)
    }
    
    func testMenuItem_whenSort_shouldDisplayEqualTotal() {
        let sut: MenuViewModel = MenuViewModel()
        
        sut.selectedSort = .popular
        sut.filterMenu()
        
        XCTAssertEqual(sut.displayedFood.count, MockData.foods.count)
        XCTAssertEqual(sut.displayedDrink.count, MockData.drinks.count)
        XCTAssertEqual(sut.displayedDesert.count, MockData.deserts.count)
    }
}
