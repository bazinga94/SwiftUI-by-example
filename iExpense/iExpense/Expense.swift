//
//  Expense.swift
//  iExpense
//
//  Created by Jongho Lee on 9/30/25.
//

import Foundation

struct Expense: Hashable {
	var title: String
	var amount: Int
	var date: Date
	var category: Category
}

enum Category: String, CaseIterable, Identifiable {
	case travel
	case food
	case lodging
	
	var id: Self { self }
}
