//
//  SimpleImageLoader.swift
//  iFeed
//
//  Created by Jongho Lee on 10/2/25.
//

import Foundation
import UIKit

final class SimpleImageLoader {
	static let shared = SimpleImageLoader()
	private let cache = NSCache<NSURL, UIImage>()

	func load(_ url: URL) async throws -> UIImage {
		if let hit = cache.object(forKey: url as NSURL) { return hit }
		let (data, _) = try await URLSession.shared.data(from: url)
		guard let img = UIImage(data: data) else { throw URLError(.cannotDecodeContentData) }
		cache.setObject(img, forKey: url as NSURL)
		return img
	}
}
