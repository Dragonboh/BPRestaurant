//
//  OrderView.swift
//  BPRestaurant
//
//  Created by admin on 17.10.2024.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        List {
            Section {
                ForEach(order.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price)")
                    }
                }
                .onDelete(perform: deleteItems)
            } header: {
                Text("Oredered Items")
            }
            
            Section {
                NavigationLink(destination: CheckoutView()) {
                    Text("Place Order")
                }
                .foregroundStyle(order.items.isEmpty ? .gray : .blue)
            } header: {
                HStack {
                    Text("Totals")
                    Spacer()
                    Text("$\(order.total)")
                }
            }.disabled(order.items.isEmpty)
        }
        .listStyle(.insetGrouped)
        .toolbar {
            EditButton()
        }
        .navigationTitle("Order")
    }
    
    func deleteItems(at offsets: IndexSet) {
       order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    NavigationView {
        OrderView()
            .environmentObject(Order())
    }
}
