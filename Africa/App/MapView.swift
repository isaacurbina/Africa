//
//  MapView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/15/25.
//

import SwiftUI
import MapKit

struct MapView: View {
	
	
	// MARK: - properties
	
	@State private var region: MKCoordinateRegion = {
		var mapCoordinates = CLLocationCoordinate2D(
				latitude: 6.600286, longitude: 16.4377599
			)
		var mapZoomLevel = MKCoordinateSpan(
			latitudeDelta: 70.0, longitudeDelta: 70.0
		)
		var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
		return mapRegion
	}()
	
	let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
	
	
	// MARK: - body
	
    var body: some View {
        // basic map
		// Map(coordinateRegion: $region)
		
		// advanced map
		Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
			// (a) pin: old style (always static)
			//MapPin(coordinate: item.location, tint: .accentColor)
			
			// (b) marker: new style (always static)
			//MapMarker(coordinate: item.location, tint: .accentColor)
			
			// (c) custom basic annotation (it could be interactive)
			MapAnnotation(coordinate: item.location) {
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 32, height: 32, alignment: .center)
			} // MapAnnotation
		})
    }
}


// MARK: - preview

struct MapView_Previews: PreviewProvider {
	static var previews: some View {
		MapView()
			.previewDevice("iPhone 16 Pro")
	}
}
