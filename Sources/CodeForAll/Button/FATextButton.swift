//
//  SwiftUIView.swift
//  
//
//  Created by Alexandra Viana on 02/03/24.
//

import SwiftUI

struct FATextButton: View {
    var action: () -> Void
    var textObject: FAText
    var hint: String
    var padding:CGFloat
    var cornerRadius:CGFloat
    var borderColor: Color
    var borderWidth: CGFloat
    var borderLength: CGFloat
    var borderHeight: CGFloat
    var isFilled: Bool
    var fillColor: Color
    
    public init(action:@escaping () -> Void,
                textLabel: FAText,
                hint: String = "",
                padding: CGFloat = 10.0,
                cornerRadius:CGFloat = 10.0,
                borderColor: Color = Color.accentColor,
                borderWidth: CGFloat = 2.0,
                borderLength: CGFloat = 100,
                borderHeight: CGFloat = 30,
                isFilled: Bool = false,
                fillColor: Color = Color.blue) {
        
        self.action = action
        self.textObject = textLabel
        self.hint = hint
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.borderLength = borderLength
        self.borderHeight = borderHeight
        self.isFilled = isFilled
        self.fillColor = fillColor
    }
    public var body: some View {
        Button (action: action ) {
            textObject
                .accessibilityHint(hint)
                .padding(padding)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: borderWidth)
                        .frame(width:borderLength, height: borderHeight)
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .frame(width:borderLength, height: borderHeight)
                        )
                        .foregroundColor(isFilled ? fillColor : Color.clear)
                )
        }
        .padding()
    }
}

#Preview {
    FATextButton(action: {} , textLabel: FAText("Texto"))
}

