//
//  File.swift
//  
//
//  Created by Akirah Dev on 05/01/23.
//  
//

import Foundation
import SwiftUI

// MARK: - Carousel Slide
public protocol CarouselSlide {
    var imageUrl: String { get }
    var placeholderImageUrl: String { get }
}

// MARK: - Carousel Director
public final class CarouselDirector {
    
    private var builder: any CarouselBuilder
    
    public var view: CarouselView {
        let spec = builder.getComponent()
        return CarouselView(spec: spec)
    }
    
    public init(type: CarouselBuilderType) {
        switch type {
        case .alpha:
            builder = CarouselAlphaBuilder()
        case .beta:
            builder = CarouselBetaBuilder()
        }
    }
    
    public func slides(data: [CarouselSlide]) -> Self {
        builder.setSlides(data: data)
        return self
    }
}

public enum CarouselBuilderType {
    case alpha
    case beta
}
