//
//  FeedView.swift
//  iFeed
//
//  Created by Jongho Lee on 9/28/25.
//

import SwiftUI

struct FeedView: View {
	@StateObject var viewModel: FeedViewModel
	
	init(viewModel: FeedViewModel) {
		self._viewModel = StateObject(wrappedValue: viewModel)
	}
	
    var body: some View {
		NavigationStack {
			List {
				ForEach(viewModel.stories) { story in
					Text(story.author)
				}
			}
		}
    }
}

#Preview {
	FeedView(viewModel: .init(repository: RemoteFeedRepository(apiClient: URLSessionHTTPClient())))
}
