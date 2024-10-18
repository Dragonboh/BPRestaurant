//
//  ItemDetail.swift
//  BPRestaurant
//
//  Created by admin on 17.10.2024.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    
    let item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button(action: {
                order.add(item: item)
            }, label: {
                Text("Order This")
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            })
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
