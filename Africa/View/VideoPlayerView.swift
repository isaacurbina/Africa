//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/24/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
	
	
	// MARK: - properties
	
	var videoSelected: String
	var videoTitle: String
	
	
	// MARK: - body
	
	var body: some View {
		VStack {
			VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
				//Text(videoTitle)
			}
			.overlay(
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 32, height: 32)
					.padding(.top, 6)
					.padding(.horizontal, 8)
				, alignment: .topLeading
			)
		} // VStack
		.accentColor(.accentColor)
		.navigationBarTitle(videoTitle, displayMode: .inline)
	}
}


// MARK: - preview

struct VideoPlayerView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
	
	static var previews: some View {
		NavigationView {
			VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
				.previewLayout(.sizeThatFits)
		}
	}
}
