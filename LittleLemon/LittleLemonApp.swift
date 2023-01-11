//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by Akirah Dev on 07/01/23.
//  
//

import SwiftUI

@main
struct LittleLemonApp: App {
    var body: some Scene {
        WindowGroup {
            MenuView(viewModel: MenuViewModel())
        }
    }
}
