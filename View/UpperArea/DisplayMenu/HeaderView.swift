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
        VStack{
            if let headerText = appState.currentMenuState.headerText {
                HStack{
                    
                    // last played note label
                    HStack(spacing: 4){
                        if appState.currentNoteToDisplay != nil {
                            Image(systemName: "music.note")
                                .imageScale(.small)
                            Text(appState.currentNoteToDisplay!.getHelpLabel())
                        }
                        Spacer()
                    }
                    .frame(width: 50)
                    
                    // reset last played note label after one second
                    .task(id: appState.currentNoteToDisplay){
                        if appState.currentNoteToDisplay != nil {
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.35){
                                appState.currentNoteToDisplay = nil
                            }
                        }
                    }
                    
                    Spacer()
                    Text(headerText)
                    Spacer()
                    
                    HStack(spacing: 4){
                        Spacer()
                        if appState.showHelp {
                            Image(systemName: "eye.fill")
                        }
                           
                    }
                    .frame(width: 50)
                }
                .font(.system(.footnote, design: .monospaced))
                
                Rectangle()
                    .fill(Color("DarkGray"))
                    .frame(maxWidth: .infinity, minHeight: 1.5, maxHeight: 1.5)
            }
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
