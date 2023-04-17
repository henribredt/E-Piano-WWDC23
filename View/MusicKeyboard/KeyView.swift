//
//  KeyView.swift
//  WWDC23
//
//  Created by Henri Bredt on 16.04.23.
//

import SwiftUI

enum Key: String {
    case white_r_cutout = "white_r_cutout"
    case white_l_cutout = "white_l_cutout"
    case white_lr_cutout = "white_lr_cutout"
    case black = "black"
}

struct KeyView: View {
    
    @EnvironmentObject var appState: AppState
    
    let kind: Key
    let label: String
    let width: CGFloat
    let height: CGFloat
    let note: Note
    
    var body: some View {
       GeometryReader { geo in
            Button {
                appState.currentNote = note
                appState.currentNoteToDisplay = note
                SoundEngine.play(note: note)
            } label: {
                ZStack(alignment: .bottom){
                    Image(kind.rawValue)
                        .resizable()
                        .scaledToFit()
                    if appState.showHelpLabels && appState.showKeyboardHelpLabels {
                        Text(label)
                            .padding(.bottom, geo.size.height/9)
                            .font(kind != .black ? .title3.bold() : .caption.bold())
                            .foregroundColor(kind != .black ? .black : .white)
                            .opacity(kind != .black ? 0.15 : 0.35)
                    }
                }
                .frame(width: width, height: kind != .black ? height : height/1.85)
                .opacity(appState.showHelp && !(appState.currentPracticeNote() == note) ? 0.5 : 1 )
            }
       }
       .frame(width: width)
    }
}

struct KeyView_Previews: PreviewProvider {
   
    static var previews: some View {
        KeyView(kind: .white_r_cutout, label: "C", width: 135, height: 578, note: .small_A)
            .frame(width: 135 , height: 578)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("White key")
        
        KeyView(kind: .black, label: "C#", width: 135, height: 578, note: .small_C_Sharp)
            .frame(width: 135 , height: 578)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Black key")
    }
}
