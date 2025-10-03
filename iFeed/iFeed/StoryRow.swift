//
//  StoryRow.swift
//  iFeed
//
//  Created by Jongho Lee on 9/28/25.
//

import SwiftUI

struct StoryRow: View {
	let story: Story
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(story.author)
				.font(.headline)
			AsyncCachedImage(url: story.image.url)
//			AsyncImage(url: story.image.url) { phase in
//				switch phase {
//				case .empty:
//					ProgressView()
//				case .success(let image):
//					image
//						.resizable()
//						.scaledToFit()
//				case .failure(_):
//					Image(systemName: "photo").imageScale(.large)
//				@unknown default:
//					EmptyView()
//				}
//			}
			Text(story.body)
		}
		.padding()
    }
}

#Preview {
	StoryRow(story: Story.example)
}
