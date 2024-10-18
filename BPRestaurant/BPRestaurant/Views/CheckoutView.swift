//
//  CheckoutView.swift
//  BPRestaurant
//
//  Created by admin on 17.10.2024.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) { type in
                        Text(type)
                    }
                }
                .pickerStyle(.automatic)
                
                Toggle("Add loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter loyalty ID", text: $loyaltyNumber)
                }
            }
            
            Section {
                
                Picker("Tips", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) { tip in
                        Text("\(tip)%")
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("add a tip?")
            }
            
            Section {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                    print("place order")
                }
                .buttonStyle(PlainButtonStyle())
            } header: {
                Text("TOTAL: \(totalPrice)")
                    .font(.largeTitle)
            }

        }
        .alert("alert Title", isPresented: $showingPaymentAlert, actions: {
            Button("OK") {
                showingPaymentAlert.toggle()
            }
        }, message: {
            Text("alert message")
        })
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        CheckoutView()
            .environmentObject(Order())
    }
}
