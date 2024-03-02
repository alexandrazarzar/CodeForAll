//
//  SwiftUIView.swift
//
//
//  Created by Alexandra Viana on 02/03/24.
//

import SwiftUI
import Accessibility

struct FALoadingView: View {
    var viewName: String
    var textHint: String
    var appearedAnnouncement: String
    var disappearedAnnouncement: String
    
    init(
        viewName: String, textHint: String = "", appearedAnnouncement: String = "", disappearedAnnouncement: String = ""
    ) {
        self.viewName = viewName
        self.textHint = textHint
        self.appearedAnnouncement = appearedAnnouncement
        self.disappearedAnnouncement = disappearedAnnouncement
    }
    
    var body: some View {
        ProgressView()
            .accessibilityLabel(viewName)
            .accessibilityHint(textHint)
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
        textHint: "Aguarde até que todas as informações sejam carregadas",
        appearedAnnouncement: "sistema carreando informações",
        disappearedAnnouncement: "carregamento de informações finalizado"
    )
}

