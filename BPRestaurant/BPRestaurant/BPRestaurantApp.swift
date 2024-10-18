//
//  BPRestaurantApp.swift
//  BPRestaurant
//
//  Created by admin on 16.10.2024.
//

import SwiftUI

@main
struct BPRestaurantApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(order)
        }
    }
}
