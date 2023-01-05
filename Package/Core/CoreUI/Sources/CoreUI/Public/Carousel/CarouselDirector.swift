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
    var body: any View { get }
}

final class CarouselAlpha: CarouselSpec {
    
    var slides: [CarouselSlide] = []
    
    var body: any View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Carousel Alpha")
            }
            .padding()
        }
    }
}

final class CarouselBeta: CarouselSpec {
    
    var slides: [CarouselSlide] = []
    
    var body: any View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Carousel Beta")
            }
            .padding()
        }
    }
}

// MARK: - Carousel Slide
public protocol CarouselSlide {
    var imageUrl: String { get }
    var placeholderImageUrl: String { get }
}

struct CarouselSlideDefault: CarouselSlide {
    let imageUrl: String
    let placeholderImageUrl: String
}

// MARK: - Carousel Director
public final class CarouselDirector {
    
    private var builder: any CarouselBuilder
    
    init(builder: any CarouselBuilder) {
        self.builder = builder
    }
    
    func setSlides(data: [CarouselSlide]) -> Self {
        builder.setSlides(data: data)
        return self
    }
    
    func getBuilderSpec() -> CarouselSpec {
        builder.getComponent()
    }
    
    var body: some View {
        VStack {
            builder
                .getComponent()
                .body
        }
    }
}

public class Client {
    
    public init() {}
    
    public var carousel: some View {
        let spec = CarouselDirector(builder: CarouselAlphaBuilder())
                        .setSlides(data: [
                            CarouselSlideDefault(imageUrl: "", placeholderImageUrl: ""),
                            CarouselSlideDefault(imageUrl: "", placeholderImageUrl: ""),
                            CarouselSlideDefault(imageUrl: "", placeholderImageUrl: ""),
                            CarouselSlideDefault(imageUrl: "", placeholderImageUrl: ""),
                        ])
                        .body
        return spec
        
//        print("Generated Carousel \(String(describing: spec))")
//        return spec.body
    }
}
