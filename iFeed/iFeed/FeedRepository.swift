//
//  FeedRepository.swift
//  iFeed
//
//  Created by Jongho Lee on 9/28/25.
//

import Foundation

protocol FeedRepository {
	func fetchNextPage() async -> [Story]
}

final class RemoteFeedRepository: FeedRepository {
	private let apiClient: HTTPClient
	private var nextPageID: String?
	private var hasMorePage: Bool
	
	init(apiClient: HTTPClient) {
		self.apiClient = apiClient
		self.hasMorePage = true
	}
	
	func fetchNextPage() async -> [Story] {
		if !hasMorePage {
			return []
		}
		
		do {
			let dto: StoriesPageDTO = try await self.apiClient.get(url: FeedEndPoint.pageURL(id: nextPageID))
			self.nextPageID = dto.nextPageId
			self.hasMorePage = (dto.nextPageId != nil)
			return dto.stories.map { Story(dto: $0) }
		} catch {
			print(error)
			return []
		}
	}
}
