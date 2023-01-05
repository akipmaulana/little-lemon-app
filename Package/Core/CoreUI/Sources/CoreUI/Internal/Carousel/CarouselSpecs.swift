//
//  File.swift
//  
//
//  Created by Akirah Dev on 05/01/23.
//  
//

import Foundation

// MARK: - Carousel Specs

protocol CarouselSpec {
    var slides: [CarouselSlide] { get set }
    var title: String { get }
}

struct CarouselAlpha: CarouselSpec {
    
    var slides: [CarouselSlide] = []
    
    var title: String {
        "Alpha"
    }
}

struct CarouselBeta: CarouselSpec {
    
    var slides: [CarouselSlide] = []
    
    var title: String {
        "Beta"
    }
}
