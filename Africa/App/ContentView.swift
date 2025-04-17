//
//  ContentView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/15/25.
//

import SwiftUI

struct ContentView: View {
	
	
	// MARK: - properties
	
	let animals: [Animal] = Bundle.main.decode("animals.json")
	
	
	// MARK: - body
	
    var body: some View {
		NavigationView {
			List {
				CoverImageView()
					.frame(height: 300)
					.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
				
				ForEach(animals) { animal in
					AnimalListItemView(animal: animal)
				}
			} // List
			.navigationBarTitle("Africa", displayMode: .large)
		} // NavigationView
    }
}

#Preview {
    ContentView()
}
