//
//  SwiftUIByExampleApp.swift
//  SwiftUIByExample
//
//  Created by Jongho Lee on 5/26/24.
//

import SwiftUI

@main
struct SwiftUIByExampleApp: App {
	@StateObject var order = Order()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(order)
        }
    }
}
