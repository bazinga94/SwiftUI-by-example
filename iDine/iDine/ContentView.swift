//
//  ContentView.swift
//  iDine
//
//  Created by Jongho Lee on 9/27/25.
//

import SwiftUI

struct ContentView: View {
	let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
	
    var body: some View {
		NavigationStack {
			List {
				ForEach(menu) { section in
					Section(section.name) {
						ForEach(section.items) { item in
							ItemRow(item: item)
						}
					}
				}
			}
			.navigationTitle("Hey There")
			.listStyle(.grouped)
		}
    }
}

#Preview {
    ContentView()
}
