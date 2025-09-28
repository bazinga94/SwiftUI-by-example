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
					Section {
						StoryRow(story: story)
							.onAppear {
								Task {
									await self.viewModel.fetchFeedIfNeeded(force: false, story: story)
								}
							}
					}
				}
				if viewModel.isLoading {
					HStack {
						Spacer()
						ProgressView()
						Spacer()
					}
				}
			}
			.task {
				await self.viewModel.fetchFeedIfNeeded(force: true)
			}
			.navigationTitle("iFeed")
		}
    }
}

#Preview {
	FeedView(viewModel: .init(repository: RemoteFeedRepository(apiClient: URLSessionHTTPClient())))
}
