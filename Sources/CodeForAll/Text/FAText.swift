//
//  SwiftUIView.swift
//  
//
//  Created by Alexandra Viana on 02/03/24.
//

import SwiftUI

public enum AccessibleFontWeight {
    case regular
    case medium
    case semibold
    case bold
    
    var textFontWeight: Font.Weight {
        switch self {
        case .regular:
            return .regular
        case .medium:
            return .medium
        case .semibold:
            return  .semibold
        case .bold:
            return .bold
        }
    }
}

public struct FAText: View {
    var text:  String
    var color: Color
    var font:  Font
    var fontWeight: AccessibleFontWeight
    var isHeader: Bool
    
    public init(_ text: String,
                color: Color = .primary,
                font: Font = .body,
                fontWeight: AccessibleFontWeight = .regular,
                isHeader: Bool = false
    ) {
        self.text = text
        self.color = color
        self.font = font
        self.fontWeight = fontWeight
        self.isHeader = isHeader
    }
    
    public var body: some View {
        if isHeader {
            accessibleText
                .accessibilityAddTraits(.isHeader)
        } else {
            accessibleText
        }
    }
    
    var accessibleText: some View {
        Text( self.text)
            .font(font)
            .foregroundColor(color)
            .fontWeight(fontWeight.textFontWeight)
    }
}

#Preview {
    FAText("Acessibilidade",
           color: .black,
           font: .headline,
           fontWeight: .bold,
           isHeader: true)
}
