//
//  VideoListView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/15/25.
//

import SwiftUI

struct VideoListView: View {
	
	
	// MARK: - properties
	
	@State var videos: [Video] = Bundle.main.decode("videos.json")
	let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
	
	
	// MARK: - body
	var body: some View {
		NavigationView {
			List {
				ForEach(videos) { item in
					NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
						VideoListItemView(video: item)
							.padding(.vertical, 8)
					} // NavigationLink
				} // ForEach
			} // List
			.listStyle(InsetGroupedListStyle())
			.navigationBarTitle("Videos", displayMode: .inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: {
						// shuffle videos
						videos.shuffle()
						hapticImpact.impactOccurred()
					}) {
						Image(systemName: "arrow.2.squarepath")
					}
				}
			}
		} // Navigation
	}
}


// MARK: - preview

struct VideoListView_Previews: PreviewProvider {
	static var previews: some View {
		VideoListView()
			.previewDevice("iPhone 16 Pro")
	}
}
