//
//  ItemRow.swift
//  SwiftUIByExample
//
//  Created by Jongho Lee on 5/26/24.
//

import SwiftUI

struct ItemRow: View {
	let item: MenuItem
	
    var body: some View {
		HStack {
			Image(item.thumbnailImage)
			VStack(alignment: .leading) {
				Text(item.name)
				Text("$\(item.price)")
			}
		}
    }
}

#Preview {
	ItemRow(item: MenuItem.example)
}
