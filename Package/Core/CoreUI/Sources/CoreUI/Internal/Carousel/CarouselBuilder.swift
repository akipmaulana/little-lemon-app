//
//  File.swift
//  
//
//  Created by Akirah Dev on 05/01/23.
//  
//

import Foundation

// MARK: - Carousel Builder

protocol CarouselBuilder {
    associatedtype C: CarouselSpec
    
    init(component: C)
    
    func getComponent() -> C
    
    @discardableResult
    func setSlides(data: [CarouselSlide]) -> Self
    
    @discardableResult
    func reset() -> Self
}

final class CarouselAlphaBuilder: CarouselBuilder {
    
    typealias Result = CarouselAlpha
    
    private var component: CarouselSpec
    
    init(component: CarouselAlpha = CarouselAlpha()) {
        self.component = component
    }
    
    func getComponent() -> CarouselAlpha {
        return component as! CarouselAlpha
    }
    
    @discardableResult
    func setSlides(data: [CarouselSlide]) -> Self {
        component.slides = data
        return self
    }
    
    @discardableResult
    func reset() -> Self {
        return self
    }
}

final class CarouselBetaBuilder: CarouselBuilder {
    
    typealias Result = CarouselBeta
    
    private var component: CarouselSpec
    
    init(component: CarouselBeta = CarouselBeta()) {
        self.component = component
    }
    
    func getComponent() -> CarouselBeta {
        return component as! CarouselBeta
    }
    
    @discardableResult
    func setSlides(data: [CarouselSlide]) -> Self {
        component.slides = data
        return self
    }
    
    @discardableResult
    func reset() -> Self {
        return self
    }
}
