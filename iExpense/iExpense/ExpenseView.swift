//
//  ExpenseView.swift
//  iExpense
//
//  Created by Jongho Lee on 9/30/25.
//

import SwiftUI

struct ExpenseView: View {
	@StateObject var viewModel: ExpenseViewModel
	@State var path: [Expense] = []
	@FocusState private var focus: Field?
	
	enum Field {
		case title
		case amount
	}
	
	init(viewModel: ExpenseViewModel) {
		self._viewModel = StateObject(wrappedValue: viewModel)
	}
	
    var body: some View {
		NavigationStack(path: $path) {
			VStack {
				Form {
					Section {
						TextField("Title", text: $viewModel.title)
							.focused($focus, equals: .title)
							.submitLabel(.next)
							.onSubmit { focus = .amount }
						if let error = viewModel.titleError {
							Text(error)
								.foregroundColor(.red)
						}
					}
					
					Section {
						TextField("Amount", value: $viewModel.amount, format: .number)
							.keyboardType(.decimalPad)
							.focused($focus, equals: .amount)
							.submitLabel(.done)
						if let error = viewModel.amountError {
							Text(error)
								.foregroundColor(.red)
						}
					}
					
					DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
					
					Picker("Category", selection: $viewModel.category) {
						ForEach(Category.allCases) { category in
							Text(category.rawValue).tag(category)
						}
					}
					
					Button("Submit") {
						Task {
							let expense = await viewModel.submit()
							if let expense {
								path.append(expense)
							}
						}
					}
					.disabled(!viewModel.isValid)
				}
			}
			.navigationDestination(for: Expense.self) { expense in
				CompleteView()
			}
		}
    }
}

#Preview {
	ExpenseView(viewModel: .init())
}
