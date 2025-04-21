//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/20/25.
//

import SwiftUI

struct ExternalWeblinkView: View {
	
	
	// MARK: - properties
	
	let animal: Animal
	
	
	// MARK: - body
	
    var body: some View {
		GroupBox {
			HStack {
				Image(systemName: "globe")
				Text("Wikipedia")
				Spacer()
				
				Group {
					Image(systemName: "arrow.up.right.square")
					Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
				} // Group
				.foregroundColor(.accentColor)
			} // HStack
		} // GroupBox
    }
}


// MARK: - preview
struct ExternalWeblinkView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
	
	static var previews: some View {
		ExternalWeblinkView(animal: animals[0])
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
