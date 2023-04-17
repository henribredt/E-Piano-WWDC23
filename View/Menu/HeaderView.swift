//
//  SwiftUIView.swift
//  
//
//  Created by Henri Bredt on 17.04.23.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        if let headerText = appState.currentMenuState.headerText {
            Text(headerText)
                .font(.system(.footnote, design: .monospaced))
            Rectangle()
                .fill(Color("DarkGray"))
                .frame(maxWidth: .infinity, minHeight: 1.5, maxHeight: 1.5)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var appState = AppState()
        HeaderView()
            .environmentObject(appState)
    }
}
