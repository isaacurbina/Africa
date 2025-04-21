//
//  VideoModel.swift
//  Africa
//
//  Created by Isaac Urbina on 4/21/25.
//

import Foundation

struct Video: Codable, Identifiable {
	let id: String
	let name: String
	let headline: String
	
	// computed property
	var thumbnail: String {
		"video-\(id)"
	}
}
