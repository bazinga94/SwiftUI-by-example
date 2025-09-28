//
//  Story.swift
//  iFeed
//
//  Created by Jongho Lee on 9/28/25.
//

import Foundation

// API Response
struct StoriesPageDTO: Codable {
	var nextPageId: String?
	var stories: [StoryDTO]
}

struct StoryDTO: Codable {
	var id: String
	var author: String
	var body: String
	var image: ImageMetaDTO
}

struct ImageMetaDTO: Codable {
	var url: String
	var width: Int
	var height: Int
}

// Domain Model
struct Story: Identifiable {
	var id: String
	var author: String
	var body: String
	var image: ImageMeta
}

struct ImageMeta {
	var url: URL?
	var width: Int
	var height: Int
}

extension Story {
	init(dto: StoryDTO) {
		self.id = dto.id
		self.author = dto.author
		self.body = dto.body
		self.image = ImageMeta(url: URL(string: dto.image.url), width: dto.image.width, height: dto.image.height)
	}
}

#if DEBUG
extension Story {
	static let example: Story = Story(id: "", author: "Jongho Lee", body: "Hello Feed", image: ImageMeta(url: URL(string: ""), width: 1260, height: 840))
}
#endif
