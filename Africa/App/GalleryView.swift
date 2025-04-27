//
//  GalleryView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/15/25.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			Text("Gallery")
		} // ScrollView
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
