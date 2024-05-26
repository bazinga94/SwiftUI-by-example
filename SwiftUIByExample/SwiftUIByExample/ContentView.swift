//
//  ContentView.swift
//  SwiftUIByExample
//
//  Created by Jongho Lee on 5/26/24.
//

import SwiftUI

struct ContentView: View {
	
	let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
	
    var body: some View {	// "some" View -> opaque return types		
		NavigationStack {
			List {
				ForEach(menu) { section in
					Section(
						header: Text(section.name), 
						content: {
							ForEach(section.items) { items in
								ItemRow(item: items)
							}
						}
					)
				}
			}
			.navigationTitle("Menu")
			.listStyle(.grouped)
		}
	}
}

// Swift 5.9 or higher
//#Preview {
//    ContentView()
//}

struct ContentView_Preview: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
