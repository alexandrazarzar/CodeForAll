//
//  SwiftUIView.swift
//
//
//  Created by Alexandra Viana on 02/03/24.
//

import SwiftUI
import Accessibility

public struct FALoadingView: View {
    var viewName: String
    var hint: String
    var appearedAnnouncement: String
    var disappearedAnnouncement: String
    
    public init(
        viewName: String,
        hint: String = "",
        appearedAnnouncement: String = "",
        disappearedAnnouncement: String = ""
    ) {
        self.viewName = viewName
        self.hint = hint
        self.appearedAnnouncement = appearedAnnouncement
        self.disappearedAnnouncement = disappearedAnnouncement
    }
    
    public var body: some View {
        ProgressView()
            .accessibilityLabel(viewName)
            .accessibilityHint(hint)
#if os(iOS)
            .onAppear(perform: {
                UIAccessibility.post(notification: .announcement, argument: appearedAnnouncement)
            })
            .onDisappear(perform: {
                
                UIAccessibility.post(notification: .announcement, argument: disappearedAnnouncement)
            })
#endif
    }
}

#Preview {
    FALoadingView(
        viewName: "Carregamento em andamento",
        hint: "Aguarde até que todas as informações sejam carregadas",
        appearedAnnouncement: "sistema carreando informações",
        disappearedAnnouncement: "carregamento de informações finalizado"
    )
}

