//
//  SwiftUIView.swift
//
//
//  Created by Alexandra Viana on 02/03/24.
//

import SwiftUI

public struct FATextField: View {
    @Binding var receivedText: String
    @Binding var isSecureField: Bool
    var label: FAText
    var color: Color
    var isMandatory: Bool
    var updatedLabel: String {
        if isMandatory {
            return label.text + "*"
        } else {
            return label.text
        }
    }
    
    public init(label: FAText,
                receivedText: Binding<String>,
                color: Color = Color.gray,
                isSecureField: Binding<Bool> = .constant(false),
                isMandatory: Bool = false
    ) {
        self.label = label
        self._receivedText = receivedText
        self.color = color
        self._isSecureField = isSecureField
        self.isMandatory = isMandatory
    }
    
    public var body: some View {
        if(isSecureField) {
            SecureField( label.text, text: $receivedText)
                .font(label.font)
                .fontWeight(label.fontWeight.textFontWeight)
                .foregroundColor(label.color)
                .border(color)
                .padding()
                .accessibilityLabel(updatedLabel)
#if os(iOS)
                .autocapitalization(.none)
#endif
        } else {
            TextField(label.text, text: $receivedText)
                .font(label.font)
                .fontWeight(label.fontWeight.textFontWeight)
                .foregroundColor(label.color)
                .border(color)
                .padding()
                .accessibilityLabel(updatedLabel)
                .accessibilityValue(receivedText)
#if os(iOS)
                .autocapitalization(.none)
#endif
        }
    }
}

#Preview {
    FATextField(label: FAText("Email"),
                receivedText: .constant(""))
}
