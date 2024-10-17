//
//  ListView.swift
//  BPRestaurant
//
//  Created by admin on 16.10.2024.
//

import SwiftUI

struct RestaurantRow: View {
    let name: String
    var body: some View {
        Text("Restaurant: \(name)")
    }
}

struct ListView: View {
    var body: some View {
        List {
            RestaurantRow(name: "Joe's Original")
            RestaurantRow(name: "The Real Joe's Original")
            RestaurantRow(name: "Original Joe's")
        }
    }
}

#Preview {
    ListView()
}
