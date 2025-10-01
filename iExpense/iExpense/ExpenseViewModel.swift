//
//  ExpenseViewModel.swift
//  iExpense
//
//  Created by Jongho Lee on 9/30/25.
//

import Foundation
import Combine

class ExpenseViewModel: ObservableObject {
	@Published var title: String
	@Published var amount: Int
	@Published var date: Date
	@Published var category: Category
	@Published var errorMessage: String
	
	var titleError: String? {
		title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "Please enter a title" : nil
	}
	
	var amountError: String? {
		amount <= 0 ? "Enter a valid amount" : nil
	}
	
	var isValid: Bool {
		titleError == nil && amountError == nil
	}
	
	init() {
		self.title = ""
		self.amount = 0
		self.date = Date.now
		self.category = .Food
		self.errorMessage = ""
	}
	
	func submit() async -> Expense? {
		if isValid {
			return Expense(title: title, amount: amount, date: date, category: category)
		} else {
			return nil
		}
	}
}
