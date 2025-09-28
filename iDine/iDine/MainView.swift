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
			Tab("Menu", systemImage: "list.dash") {
				ContentView()
			}
			Tab("Order", systemImage: "square.and.pencil") {
				OrderView()
			}
		}
    }
}

#Preview {
    MainView()
		.environmentObject(Order())
}
