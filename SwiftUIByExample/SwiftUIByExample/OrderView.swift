//
//  OrderView.swift
//  SwiftUIByExample
//
//  Created by Jongho Lee on 5/27/24.
//

import SwiftUI

struct OrderView: View {
	@EnvironmentObject var order: Order
	
    var body: some View {
		NavigationStack {
			List {
				Section {
					ForEach(order.items) { item in
						HStack {
							Text(item.name)
							Spacer()
							Text("$\(item.price)")
						}
					}
				}
				
				Section {
					NavigationLink("Place Order") {
						CheckoutView()
					}
				}
			}
			.navigationTitle("Order")
		}
    }
}

#Preview {
	OrderView().environmentObject(Order())
}
