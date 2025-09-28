//
//  FeedViewModel.swift
//  iFeed
//
//  Created by Jongho Lee on 9/28/25.
//

import Foundation
import Combine

class FeedViewModel: ObservableObject {
	@Published var stories: [Story] = []
	
	private let repository: FeedRepository
	
	init(repository: FeedRepository) {
		self.repository = repository
	}
	
	func fetchFeed() async {
		let newStories = await self.repository.fetchNextPage()
		if !newStories.isEmpty {
			self.stories.append(contentsOf: newStories)
		}
	}
}
