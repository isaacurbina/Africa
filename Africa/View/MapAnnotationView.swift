//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/26/25.
//

import SwiftUI

struct MapAnnotationView: View {
	
	
	// MARK: - properties
	
	var location: NationalParkLocation
	@State private var animation: Double = 0.0
	
	
	// MARK: -  body
	
    var body: some View {
		ZStack {
			Circle()
				.fill(Color.accentColor)
				.frame(width: 54, height: 54, alignment: .center)
			
			Circle()
				.stroke(Color.accentColor, lineWidth: 2)
				.frame(width: 52, height: 52, alignment: .center)
				.scaleEffect(1 + CGFloat(animation))
				.opacity(1 - animation)
			
			Image(location.image)
				.resizable()
				.scaledToFit()
				.frame(width: 48, height: 48, alignment: .center)
				.clipShape(Circle())
		} // ZStack
		.onAppear {
			withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
				animation = 1
			}
		}
    }
}


// MARK: - preview

struct MapAnnotationView_Previews: PreviewProvider {
	static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
	
	static var previews: some View {
		MapAnnotationView(location: locations[0])
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
