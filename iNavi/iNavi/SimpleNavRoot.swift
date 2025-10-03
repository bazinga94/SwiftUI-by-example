//
//  SimpleNavRoot.swift
//  iNavi
//
//  Created by Jongho Lee on 10/2/25.
//

import SwiftUI

enum Route: Hashable {
	case detail(Int)
	case confirm(message: String)
}

struct SimpleNavRoot: View {
	@State private var path: [Route] = []
	@State private var counter = 0

	var body: some View {
		NavigationStack(path: $path) {
			VStack(spacing: 16) {
				Text("Home")
					.font(.largeTitle)

				Button("Push Detail (\(counter))") {
					counter += 1
					path.append(.detail(counter))
				}

				Button("Deep Link: Detail → Confirm") {
					counter += 1
					path = [.detail(counter), .confirm(message: "Saved #\(counter)")]
				}

				Button("Pop to Root") {
					path = []
				}
			}
			.padding()
			.navigationTitle("Simple")
			.navigationDestination(for: Route.self) { route in
				switch route {
				case .detail(let n):
					DetailView(number: n) {
						path.append(.confirm(message: "You tapped \(n)"))
					}
				case .confirm(let message):
					ConfirmView(message: message) {
						path = [] // 완료 후 루트로
					}
				}
			}
		}
	}
}

struct DetailView: View {
	let number: Int
	let onNext: () -> Void

	var body: some View {
		VStack(spacing: 16) {
			Text("Detail #\(number)")
				.font(.title)
			Button("Proceed") { onNext() }
		}
		.padding()
		.navigationTitle("Detail")
	}
}

struct ConfirmView: View {
	let message: String
	let onDone: () -> Void

	var body: some View {
		VStack(spacing: 16) {
			Text(message).font(.title3)
			Button("Done") { onDone() }
		}
		.padding()
		.navigationTitle("Confirm")
	}
}


#Preview {
    SimpleNavRoot()
}
