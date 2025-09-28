//
//  ContentView.swift
//  iFeed
//
//  Created by Jongho Lee on 9/27/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		FeedView(viewModel: FeedViewModel(repository: RemoteFeedRepository(apiClient: URLSessionHTTPClient())))
    }
}

#Preview {
    ContentView()
}
