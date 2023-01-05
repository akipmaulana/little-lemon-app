//
//  File.swift
//  
//
//  Created by Akirah Dev on 05/01/23.
//  
//

import Foundation
import SwiftUI

// MARK: - Carousel Builder

public protocol CarouselBuilder {
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

// MARK: - Carousel Specs

public protocol CarouselSpec {
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

// MARK: - Carousel Slide
public protocol CarouselSlide {
    var imageUrl: String { get }
    var placeholderImageUrl: String { get }
}

// MARK: - Carousel Director
public final class CarouselDirector {
    
    private var builder: any CarouselBuilder
    
    public var body: CustomCarouselView {
        let spec = builder.getComponent()
        return CustomCarouselView(spec: spec)
    }
    
    public init(builderType: CarouselBuilderType) {
        switch builderType {
        case .alpha:
            builder = CarouselAlphaBuilder()
        case .beta:
            builder = CarouselBetaBuilder()
        }
    }
    
    public func setSlides(data: [CarouselSlide]) -> Self {
        builder.setSlides(data: data)
        return self
    }
}

public enum CarouselBuilderType {
    case alpha
    case beta
}

public struct CustomCarouselView: View {
    
    let spec: CarouselSpec
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Carousel \(spec.title)")
        }
        .padding()
    }
}
