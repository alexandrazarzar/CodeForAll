//
//  SwiftUIView.swift
//  
//
//  Created by Alexandra Viana on 02/03/24.
//

import SwiftUI

struct FAImageButton: View {
    var action: () -> Void
    var image: FADescriptiveImage
    var hint: String
    
    init(action: @escaping () -> Void,
         image: FADescriptiveImage,
         hint: String = "") {
        self.action = action
        self.image = image
        self.hint = hint
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            image
                .accessibilityHint(hint)
        }
    }
}

#Preview {
    FAImageButton(
        action: {},
        image: FADescriptiveImage("paperplane.fill",
                                  imageAccessibilityDescription: "enviar",
                                  isSystemImage: true),
        hint: "selecione para enviar imagens para outro dispositivo"
    )
}

