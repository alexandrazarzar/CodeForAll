//
//  SwiftUIView.swift
//
//
//  Created by Alexandra Viana on 02/03/24.
//

import SwiftUI

public struct FADescriptiveImage: View {
    let isSystemImage: Bool
    let imageName: String
    let accessibilityDescription: String
    
    public init(_ imageName: String,
                imageAccessibilityDescription: String,
                isSystemImage: Bool = false
    ) {
        self.imageName = imageName
        self.accessibilityDescription = imageAccessibilityDescription
        self.isSystemImage = isSystemImage
    }
    
    public var body: some View {
        VStack {
            if isSystemImage {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .accessibilityLabel(Text(accessibilityDescription))
            } else {
                Image(imageName, label: Text(accessibilityDescription))
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    VStack {
        FADescriptiveImage("moon.stars.fill",
                           imageAccessibilityDescription: "Noite estrelada",
                           isSystemImage: true)
        .padding(100)
    }
    .padding()
}

