//
//  LocationModel.swift
//  Africa
//
//  Created by Isaac Urbina on 4/25/25.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
	// json properties
	var id: String
	var name: String
	var image: String
	var latitude: Double
	var longitude: Double
	
	// computed property
	var location: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}
