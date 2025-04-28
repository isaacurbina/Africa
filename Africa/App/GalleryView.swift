//
//  GalleryView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/15/25.
//

import SwiftUI

struct GalleryView: View {
	
	
	// MARK: - properties
	
	@State private var selectedAnimal: String = "lion"
	let animals: [Animal] = Bundle.main.decode("animals.json")
	let haptics = UIImpactFeedbackGenerator(style: .medium)
	// simple grid definition
//	let gridLayout: [GridItem] = [
//		GridItem(.flexible()),
//		GridItem(.flexible()),
//		GridItem(.flexible())
//	]
	
	
	// efficient grid definition
//	let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
	
	// dynamic grid layout
	@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
	@State private var gridColumn: Double = 3.0
	
	
	// MARK: - functions
	
	func gridSwitch() {
		gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
	}
	
	
	// MARK: - body
	
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .center, spacing: 30) {
				
				
				// MARK: - image
				
				Image(selectedAnimal)
					.resizable()
					.scaledToFit()
					.clipShape(Circle())
					.overlay(Circle().stroke(Color.white, lineWidth: 8))
				
				
				// MARK: - slider
				
				Slider(value: $gridColumn, in : 2...4, step: 1)
					.padding(.horizontal)
					.onChange(of: gridColumn) {
						gridSwitch()
					}
				
				
				// MARK: - grid
				
				LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
					ForEach(animals) { item in
						Image(item.image)
							.resizable()
							.scaledToFit()
							.clipShape(Circle())
							.overlay(Circle().stroke(Color.white, lineWidth: 1))
							.onTapGesture {
								selectedAnimal = item.image
								haptics.impactOccurred()
							}
					} // ForEach
				} // LazyVGrid
				.animation(.easeIn)
				.onAppear(perform: {
					gridSwitch()
				})
			} // VStack
			.padding(.horizontal, 10)
			.padding(.vertical, 50)
			
		} // ScrollView
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(MotionAnimationView())
    }
}


// MARK: - preview

#Preview {
    GalleryView()
}
