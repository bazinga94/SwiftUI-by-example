//
//  AsyncCachedImage.swift
//  iFeed
//
//  Created by Jongho Lee on 10/2/25.
//

import SwiftUI

struct AsyncCachedImage: View {
	let url: URL?
	
	@State private var uiImage: UIImage?
	@State private var isLoading = false
	
	var body: some View {
		Group {
			if let img = uiImage {
				Image(uiImage: img).resizable().scaledToFit()
			} else if isLoading {
				ProgressView()
			} else {
				Image(systemName: "photo").imageScale(.large)
			}
		}
		.task(id: url) {
			guard let url else { return }
			isLoading = true
			uiImage = try? await SimpleImageLoader.shared.load(url)
			isLoading = false
		}
	}
}

#Preview {
	AsyncCachedImage(url: nil)
}
