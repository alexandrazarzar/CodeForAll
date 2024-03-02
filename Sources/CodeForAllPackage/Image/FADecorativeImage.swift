//
//  SwiftUIView.swift
//
//
//  Created by Alexandra Viana on 02/03/24.
//

import SwiftUI

struct FADecorativeImage: View {
    let isSystemImage: Bool
    let imageName: String
    
    init(_ imageName: String, isSystemImage: Bool = false) {
        self.imageName = imageName
        self.isSystemImage = isSystemImage
    }
    
    var body: some View {
        if isSystemImage {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .accessibility(hidden: true)
            
        } else {
            Image(decorative: imageName)
                .resizable()
                .scaledToFit()
        }
        
    }
}

#Preview {
    VStack {
        FADecorativeImage("ATENCAO-FUNDO-PRETO")
        
        
        FADecorativeImage("exclamationmark.circle.fill",
                          isSystemImage: true)
        .padding(.horizontal, 20)
    }.padding(10)
}
