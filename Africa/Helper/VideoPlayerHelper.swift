//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Isaac Urbina on 4/24/25.
//

import Foundation
import AVKit

private var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
	if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
		videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
		videoPlayer?.play()
	}
	
	return videoPlayer!
}
