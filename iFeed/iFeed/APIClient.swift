//
//  APIClient.swift
//  iFeed
//
//  Created by Jongho Lee on 9/28/25.
//

import Foundation

protocol HTTPClient {
	func get<T: Decodable>(url: URL) async throws -> T
}

final class URLSessionHTTPClient: HTTPClient {
	func get<T: Decodable>(url: URL) async throws -> T {
		let (data, urlResponse) = try await URLSession.shared.data(from: url)
		
		guard let http = urlResponse as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
			throw URLError(.badServerResponse)
		}
		
		do {
			let decoder = JSONDecoder()
			let result = try decoder.decode(T.self, from: data)
			return result
		} catch {
			throw error
		}
	}
}

enum FeedEndPoint {
	static func pageURL(id: String?) -> URL {
		if let id {
			return URL(string: "TODO\(id)")!
		} else {
			return URL(string: "TODO")!
		}
	}
}
