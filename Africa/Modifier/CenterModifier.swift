//
//  CenterModifier.swift
//  Africa
//
//  Created by Isaac Urbina on 4/29/25.
//

import SwiftUI

struct CenterModifier: ViewModifier {
	func body(content: Content) -> some View {
		HStack {
			Spacer()
			content
			Spacer()
		}
	}
}
