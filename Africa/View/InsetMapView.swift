//
//  InsetMapView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/20/25.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
	
	
	// MARK: - properties
	
	@State private var region = MKCoordinateRegion(
		center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
		span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
	)
	
	
	// MARK: - body
	
	var body: some View {
		Map(coordinateRegion: $region)
			.overlay(
				NavigationLink(destination: MapView()) {
					HStack {
						Image(systemName: "mappin.circle")
							.foregroundColor(.white)
							.imageScale(.large)
						Text("Locations")
							.foregroundColor(.accentColor)
							.fontWeight(.bold)
					} // HStack
					.padding(.vertical, 10)
					.padding(.horizontal, 14)
					.background(
						Color.black.opacity(0.4).cornerRadius(8)
					)
				} // NavigationLink
					.padding(12), alignment: .topTrailing
			)
			.frame(height: 256)
			.cornerRadius(12)
	}
}


// MARK: - preview
struct InsetMapView_Previews: PreviewProvider {
	static var previews: some View {
		InsetMapView()
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
