//
//  CreditsView.swift
//  Africa
//
//  Created by Isaac Urbina on 4/29/25.
//

import SwiftUI

struct CreditsView: View {
	
	
	// MARK: - body
	
    var body: some View {
		VStack {
			Image("compass")
				.resizable()
				.scaledToFit()
				.frame(width: 128, height: 128)
			
			Text("""
Copyright © Isaac Urbina
All right reserved
Better Apps ♡ Less Code
""")
			.font(.footnote)
			.multilineTextAlignment(.center)
		} // VStack
		.padding()
		.opacity(0.4)
    }
}


// MARK: - preview

struct CreditsView_Previews: PreviewProvider {
	static var previews: some View {
		CreditsView()
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
