//
//  ItemRow.swift
//  SwiftUIByExample
//
//  Created by Jongho Lee on 5/26/24.
//

import SwiftUI

struct ItemRow: View {
	let item: MenuItem
	let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
	
    var body: some View {
		HStack {
			Image(item.thumbnailImage)
				.clipShape(Circle())
				.overlay(Circle().stroke(.gray, lineWidth: 2.0))
				.padding(.leading, 30)
			VStack(alignment: .leading) {
				Text(item.name)
					.font(.headline)
				Text("$\(item.price)")
			}
			Spacer()
			ForEach(item.restrictions, id: \.self) { restriction in
				Text(restriction)
					.font(.caption)
					.fontWeight(.black)
					.padding(5)
					.background(colors[restriction, default: .black])
					.clipShape(Circle())
					.foregroundStyle(.white)
				
			}
			Spacer().frame(width: 30)
		}
    }
}

#Preview {
	ItemRow(item: MenuItem.example)
}
