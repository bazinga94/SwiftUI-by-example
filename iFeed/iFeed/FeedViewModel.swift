//
//  FeedViewModel.swift
//  iFeed
//
//  Created by Jongho Lee on 9/28/25.
//

import Foundation
import Combine

@MainActor
class FeedViewModel: ObservableObject {
	@Published var stories: [Story] = []
	@Published var isLoading: Bool = false
	
	private let repository: FeedRepository
	
	init(repository: FeedRepository) {
		self.repository = repository
	}
	
	func fetchFeedIfNeeded(force: Bool, story: Story? = nil) async {
		guard force || shouldFetchMore(story: story) else {
			return
		}
		isLoading = true
		defer {
			isLoading = false
		}
		
		let newStories = await self.repository.fetchNextPage()
		if !newStories.isEmpty {
			self.stories.append(contentsOf: newStories)
		}
	}
	
	private func shouldFetchMore(story: Story?) -> Bool {
		if let story, let lastID = stories.last?.id, story.id == lastID {
			return true
		}
		return false
	}
}
