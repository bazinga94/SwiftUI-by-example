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
//        Text("Hello SwiftUI")
//			.padding()
		
//		List {
//			Text("1")
//			Text("2")
//			Text("3")
//		}
		
		NavigationStack {
			List {
				ForEach(menu) { section in
					Section(
						header: Text(section.name), 
						content: {
							ForEach(section.items) { items in
								Text(items.name)
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
