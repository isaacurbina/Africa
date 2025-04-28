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
	let haptics = UIImpactFeedbackGenerator(style: .medium)
	
	@State private var isGridViewActive: Bool = false
	@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
	@State private var gridColumn: Int = 1
	@State private var toolbarIcon: String = "square.grid.2x2"
	
	
	// MARK: - functions
	
	func gridSwitch() {
		gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count %  3 + 1)
		gridColumn = gridLayout.count
		print("Grid Number: \(gridColumn)")
		
		// toolbar image
		switch gridColumn {
		case 1: 
			toolbarIcon = "square.grid.2x2"
		case 2: 
			toolbarIcon = "square.grid.3x2"
		case 3:
			toolbarIcon = "rectangle.grid.1x2"
		default:
			toolbarIcon = "square.grid.2x2"
		}
	}
	
	
	// MARK: - body
	
	var body: some View {
		NavigationView {
			Group {
				if !isGridViewActive {
					List {
						CoverImageView()
							.frame(height: 300)
							.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
						
						ForEach(animals) { animal in
							NavigationLink(destination: AnimalDetailView(animal: animal)) {
								AnimalListItemView(animal: animal)
							} // NavigationLink
						} // ForEach
					} // List
					
				} else {
					ScrollView(.vertical, showsIndicators: false) {
						LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
							ForEach(animals) { animal in
								NavigationLink(destination: AnimalDetailView(animal: animal)) {
									AnimalGridItemView(animal: animal)
								} // NavigationLink
							} // ForEach
						} // LazyVGrid
						.padding(10)
						.animation(.easeIn)
					} // ScrollView
				} // if-else
				
			} // Group
			.navigationBarTitle("Africa", displayMode: .large)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					HStack(spacing: 16) {
						// list
						Button(action: {
							print("List view is activated")
							isGridViewActive = false
							haptics.impactOccurred()
						}) {
							Image(systemName: "square.fill.text.grid.1x2")
								.font(.title2)
								.foregroundColor(isGridViewActive ? .primary : .accentColor)
						}
						
						// grid
						Button(action: {
							print("Grid view is activated")
							isGridViewActive = true
							haptics.impactOccurred()
							gridSwitch()
						}) {
							Image(systemName: toolbarIcon)
								.font(.title2)
								.foregroundColor(isGridViewActive ? .accentColor : .primary)
						}
					}
				}
			} // Toolbar
		} // NavigationView
	}
}


// MARK: - preview

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
