//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/27/25.
//

import SwiftUI

struct MotionAnimationView: View {
	
	
	// MARK: - properties
	
	@State private var randomCircle = Int.random(in: 12...16)
	@State private var isAnimating = false
	
	
	// MARK: - functions
	
	// 1. random coordinate
	func randomCoordinate(max: CGFloat) -> CGFloat {
		return CGFloat.random(in: 0...max)
	}
	
	// 2. random size
	func randomSize() -> CGFloat {
		return CGFloat(Int.random(in: 10...300))
	}
	
	// 3. random scale
	func randomScale() -> CGFloat {
		return CGFloat(Double.random(in: 0.1...2.0))
	}
	
	// 4. random speed
	func randomSpeed() -> Double {
		return Double.random(in: 0.01...1.25)
	}
	
	// 5. random delay
	func randomDelay() -> Double {
		return Double.random(in: 0.0...3.0)
	}
	
	// MARK: - body
	
	var body: some View {
		GeometryReader { geometry in
			ZStack {
				ForEach(0...randomCircle, id: \.self) { item in
					Circle()
						.foregroundColor(.gray)
						.opacity(0.15)
						.frame(width: randomSize(), height: randomSize(), alignment: .center)
						.scaleEffect(isAnimating ? randomScale() : 1)
						.position(
							x: randomCoordinate(max: geometry.size.width),
							y: randomCoordinate(max: geometry.size.height)
						)
						.animation(
							Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
								.repeatForever()
								.speed(randomSpeed())
								.delay(randomDelay())
						)
						.onAppear(perform: {
							isAnimating = true
						})
				} // ForEach
			} // ZStack
		} // GeometryReader
	}
}


// MARK: - preview

struct MotionAnimationView_Previews: PreviewProvider {
	static var previews: some View {
		MotionAnimationView()
			.previewLayout(.sizeThatFits)
	}
}
