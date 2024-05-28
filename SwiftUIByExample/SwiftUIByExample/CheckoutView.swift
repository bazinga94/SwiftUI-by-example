//
//  CheckoutView.swift
//  SwiftUIByExample
//
//  Created by Jongho Lee on 5/27/24.
//

import SwiftUI

struct CheckoutView: View {
	@EnvironmentObject var order: Order
	@State private var paymentType = "Cash"
	@State private var addLoyaltyDetails: Bool = false
	@State private var loyaltyNumber = ""
	@State private var tipAmount = 15
	@State private var showingPaymentAlert = false
	
	let paymentTypes = ["Cash", "Credit Card", "Points"]
	let tipAmounts = [10, 15, 20, 25, 0]
	var totalPrice: String {
		let total = Double(order.total)
		let tip = total / 100 * Double(tipAmount)
		return (total + tip).formatted(.currency(code: "USD"))
	}
	
    var body: some View {
		Text(paymentType)
		Form {
			Section {
				Picker("How do you want to pay?", 
					   selection: $paymentType,	// two-way binding(read/write)
					   content: {
					ForEach(paymentTypes, id: \.self) {
						Text($0)
					}
				})
				Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
				if addLoyaltyDetails {
					TextField("Enter your iDine ID", text: $loyaltyNumber)
				}
			}
			Section("Add a tip?") {
				Picker("Percentage:",
					   selection: $tipAmount,
					   content: {
					ForEach(tipAmounts, id: \.self) {
						Text("\($0)%")
					}
				})
				.pickerStyle(.segmented)
			}
			Section("Total: \(totalPrice)") {
				Button("Confirm order") {
					showingPaymentAlert.toggle()
				}
			}
		}
		.alert("Order confirmed",
			   isPresented: $showingPaymentAlert,
			   actions: {
			// add buttons here
		},
			   message: {
			Text("Your total was \(totalPrice) – thank you!")
		})
		.navigationTitle("Payment")
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
	NavigationStack {
		CheckoutView()
			.environmentObject(Order())
	}
}
