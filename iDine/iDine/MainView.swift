//
//  MainView.swift
//  iDine
//
//  Created by Jongho Lee on 9/27/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
		TabView {
			Tab("Menu", image: "list.dash") {
				ContentView()
			}
			Tab("Order", image: "square.and.pencil") {
				OrderView()
			}
		}
    }
}

#Preview {
    MainView()
		.environmentObject(Order())
}
