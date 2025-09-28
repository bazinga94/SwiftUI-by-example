//
//  iDineApp.swift
//  iDine
//
//  Created by Jongho Lee on 9/27/25.
//

import SwiftUI

@main
struct iDineApp: App {
	@StateObject var order = Order()
	
    var body: some Scene {
        WindowGroup {
			MainView()
				.environmentObject(order)
        }
    }
}
