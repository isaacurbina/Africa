//
//  CoverImageView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/16/25.
//

import SwiftUI

struct CoverImageView: View {
	
	
	// MARK: - properties
	
	let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
	
	
	// MARK: - body
	
    var body: some View {
		TabView {
			ForEach(coverImages) { item in
				Image(item.name)
					.resizable()
					.scaledToFill()
			} // ForEach
		} // TabView
		.tabViewStyle(PageTabViewStyle())
    }
}


// MARK: - preview

struct CoverImageView_Previews: PreviewProvider {
	static var previews: some View {
		CoverImageView()
			.previewLayout(.fixed(width: 400, height: 300))
	}
}
