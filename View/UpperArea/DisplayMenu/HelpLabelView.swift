//
//  SwiftUIView.swift
//  
//
//  Created by Henri Bredt on 17.04.23.
//

import SwiftUI

@available(iOS 16.0, *)
struct HelpLabelView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HStack(spacing: 10){
            if appState.currentMenuState.helpPlayNotesLabel {
                Text("Play all notes to continue.")
            }
            Text("Press")
            Text(appState.currentMenuState.helpLabel)
                .font(.system(.caption2, design: .monospaced, weight: .medium))
                .lineLimit(1)
                .allowsTightening(true)
                .padding(EdgeInsets(top: 3, leading: 9, bottom: 3, trailing: 9))
                .overlay{
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color("DarkGray"), lineWidth: 1.2)
                        
                }
            Text(appState.currentMenuState.helpDescription)
        }
        .font(.system(.footnote, design: .monospaced))
    }
}

@available(iOS 16.0, *)
struct HelpLabelView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var appState = AppState()
        HelpLabelView()
            .environmentObject(appState)
    }
}
