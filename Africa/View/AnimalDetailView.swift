//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/17/25.
//

import SwiftUI

struct AnimalDetailView: View {
	
	
	// MARK: - properties
	
	let animal: Animal
	
	
	// MARK: - body
	
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .center, spacing: 20) {
				
				// hero image
				Image(animal.image)
					.resizable()
					.scaledToFit()
				
				// title
				Text(animal.name.uppercased())
					.font(.largeTitle)
					.fontWeight(.heavy)
					.multilineTextAlignment(.center)
					.padding(.vertical, 8)
					.foregroundColor(.primary)
					.background(
						Color.accentColor
							.frame(height: 6)
							.offset(y: 24)
					)
				
				// headline
				Text(animal.headline)
					.font(.headline)
					.multilineTextAlignment(.leading)
					.foregroundColor(.accentColor)
					.padding(.horizontal)
				
				// gallery
				Group {
					HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
					
					InsetGalleryView(animal: animal)
				} // Group
				.padding(.horizontal)
				
				// facts
				
				
				// description
				
				
				// map
				
				
				// link
				
				
			} // VStack
			.navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
		} // ScrollView
    }
}


// MARK: - preview

struct AnimalDetailView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
	
	static var previews: some View {
		NavigationView {
			AnimalDetailView(animal: animals[0])
		}
		.previewDevice("iPhone 11 Pro")
	}
}
