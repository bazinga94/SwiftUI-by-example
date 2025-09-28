//
//  iFeedApp.swift
//  iFeed
//
//  Created by Jongho Lee on 9/27/25.
//

import SwiftUI

@main
struct iFeedApp: App {
    var body: some Scene {
        WindowGroup {
			FeedView(viewModel: FeedViewModel(repository: RemoteFeedRepository(apiClient: URLSessionHTTPClient())))
        }
    }
}
