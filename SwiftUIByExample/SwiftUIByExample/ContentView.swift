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
							ForEach(section.items) { item in
//								ItemRow(item: item)
								
								// This is a bad example
								// Always List creates ItemDetail for every visible row
//								NavigationLink(
//									destination: {
//										ItemDetail(item: item)
//									},
//									label: {
//										ItemRow(item: item)	// Existing contents
//									}
//								)
								
								NavigationLink(
									value: item,
									label: {
										ItemRow(item: item)
									}
								)
							}
						}
					)
				}
			}
			.navigationDestination(		// More faster and simpler way
				for: MenuItem.self,
				destination: { item in
					ItemDetail(item: item)
				}
			)
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
