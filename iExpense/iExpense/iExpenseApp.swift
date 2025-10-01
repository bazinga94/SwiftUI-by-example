//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Jongho Lee on 9/30/25.
//

import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
			ExpenseView(viewModel: .init())
        }
    }
}
