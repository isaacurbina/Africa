//
//  InsetFactView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/20/25.
//

import SwiftUI

struct InsetFactView: View {
	
	
	// MARK: - properties
	
	let animal: Animal
	
	
	// MARK: - body
	
    var body: some View {
		GroupBox {
			TabView {
				ForEach(animal.fact, id: \.self) { item in
					Text(item)
				}
			} // TabView
			.tabViewStyle(PageTabViewStyle())
			.frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
		} // GroupBox
    }
}


// MARK: - preview

struct InsetFactView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
	
	static var previews: some View {
		InsetFactView(animal: animals[0])
	}
}
