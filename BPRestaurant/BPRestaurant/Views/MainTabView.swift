//
//  MainTabView.swift
//  BPRestaurant
//
//  Created by admin on 17.10.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                ContentView()
            }.tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            
            NavigationView {
                OrderView()
            }.tabItem {
                Label("Order", systemImage: "square.and.pencil")
            }
            
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(Order())
}
