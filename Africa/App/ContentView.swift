//
//  ContentView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/15/25.
//

import SwiftUI

struct ContentView: View {
	
	
	// MARK: - properties
	
	
	
	// MARK: - body
	
    var body: some View {
		NavigationView {
			List {
				CoverImageView()
					.frame(height: 300)
					.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
			} // List
			.navigationBarTitle("Africa", displayMode: .large)
		} // NavigationView
    }
}

#Preview {
    ContentView()
}
