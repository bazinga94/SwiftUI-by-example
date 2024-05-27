//
//  ItemDetail.swift
//  SwiftUIByExample
//
//  Created by Jongho Lee on 5/26/24.
//

import SwiftUI

struct ItemDetail: View {
	let item: MenuItem
	
    var body: some View {
		VStack {
			ZStack(alignment: .bottomTrailing) {
				Image(item.mainImage)
					.resizable()
					.scaledToFit()
//					.scaledToFill()
				Text("Photo: \(item.photoCredit)")
					.padding(4)
					.background(.black)
					.font(.caption)
					.foregroundColor(.white)
					.offset(x: -10, y: -5)
			}
			Text(item.description)
				.padding()
			Spacer()
		}
		.navigationTitle(item.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//	ItemDetail(item: MenuItem.example)
//}

// To let preview know the navigation stack
#Preview {
	NavigationStack {
		ItemDetail(item: MenuItem.example)
	}
}
