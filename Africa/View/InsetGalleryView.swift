//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/17/25.
//

import SwiftUI

struct InsetGalleryView: View {
	
	
	// MARK: - preview
	
	let animal: Animal
	
	
	// MARK: - body
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(alignment: .center, spacing: 15) {
				ForEach(animal.gallery, id: \.self) { item in
					Image(item)
						.resizable()
						.scaledToFit()
						.frame(height: 200)
						.cornerRadius(12)
				} // ForEach
			} // HStack
		} // ScrollView
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
	
	static var previews: some View {
		InsetGalleryView(animal: animals[0])
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
