//
//  KeyView.swift
//  WWDC23
//
//  Created by Henri Bredt on 16.04.23.
//

import SwiftUI

// Used to compose an Octave for the keyboard
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
                
                // activate help when the wrong key is pressed repetitively
                if appState.currentPracticeNote() != nil{
                    if appState.currentNote != appState.currentPracticeNote() {
                        appState.increaseWrongAnswerCount()
                    } else if appState.wrongAnswerCount >= 3 {
                            appState.wrongAnswerCount = 0
                            appState.showHelp = false
                    } else {
                        // note was correct, reset wrongAnswerCount count
                        appState.wrongAnswerCount = 0
                    }
                }
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
