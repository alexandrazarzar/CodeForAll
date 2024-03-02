//
//  SwiftUIView.swift
//  
//
//  Created by Alexandra Viana on 02/03/24.
//

import SwiftUI

struct FAToggle: View {
    @Binding var enableToggle: Bool
    var toggleText: FAText
    var enabledLabel: String
    var disabledLabel: String
    
    public init(enableToggle: Binding<Bool>,
                toggleLabel: FAText,
                enabledLabel: String = "enable",
                disabledLabel: String = "disabled"
    ) {
        self._enableToggle = enableToggle
        self.toggleText = toggleLabel
        self.enabledLabel = enabledLabel
        self.disabledLabel = disabledLabel
    }
    
    public var body: some View {
        Toggle(isOn: $enableToggle){
            Text(toggleText.text)
        }
        .accessibilityValue(enableToggle == true ? enabledLabel : disabledLabel)
        .padding()
    }
}

#Preview {
    FAToggle(enableToggle: .constant(true), toggleLabel: FAText("Toggle"))
}
