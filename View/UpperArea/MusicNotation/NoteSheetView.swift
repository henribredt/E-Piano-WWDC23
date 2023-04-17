//
//  SwiftUIView.swift
//  
//
//  Created by Henri Bredt on 17.04.23.
//

import SwiftUI

struct NoteSheetView: View {
    @EnvironmentObject var appState: AppState
    
    let noteHeight: CGFloat
    let notes: [Note]
    
    var body: some View {
        lines
            .overlay(alignment: .leading){
                ViolinClefShape()
                    .frame(width: noteHeight*7.5, height: noteHeight*7.5*1052/744)
                    .offset(x: -1.5*noteHeight)
            }
            .overlay {
                HStack(spacing: noteHeight*2){
                    ForEach(Array(notes.enumerated()), id: \.offset) { index, note in
                        NoteShape(helpLine: getNoteNeedsHelpLine(note: note))
                            .offset(y: getNoteOffsetInViolinClef(note: note)*noteHeight)
                            .aspectRatio(250/145, contentMode: .fill)
                            .frame(width: noteHeight*145/250, height: noteHeight)
                            .overlay {
                                // help label
                                Text(note.getHelpLabel())
                                    .offset(y: -3.5*noteHeight)
                            }
                            .opacity(appState.currentPracticeNoteIndex > index ? 0.5 : 1 )
                    }
                }
            }
//            .task(id: appState.currentMenuState) {
//                appState.practiceNotes = notes
//                appState.currentNote = nil
//                appState.currentPracticeNoteIndex = 0
//            }
            .onChange(of: appState.currentNote) { currentNote in
                if currentNote == appState.practiceNotes?[appState.currentPracticeNoteIndex] {
                    
                    if appState.currentPracticeNoteIndex < appState.practiceNotes?.count ?? 0 {
                        appState.currentPracticeNoteIndex += 1
                    }
                    
                    if appState.currentPracticeNoteIndex >= appState.practiceNotes?.count ?? 0 {
                        // end
                        DispatchQueue.main.asyncAfter(deadline: .now()+1.3) {
                            SoundEngine.playCelebration()
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                                appState.currentMenuState.showNextMenuState()
                            }
                        }
                    } else {
                        // next
                        appState.currentNote = nil
                    }
                }
            }
    }
    
    func getNoteOffsetInViolinClef(note: Note) -> CGFloat {
        switch note {
        case .oneLine_C:
            return 3
        case .oneLine_D:
            return 2.5
        case .oneLine_E:
            return 2
        case .oneLine_F:
            return 1.5
        case .oneLine_G:
            return 1
        case .oneLine_A:
            return 0.5
        case .oneLine_B:
            return 0
            
        default:
            fatalError("Note \(note.rawValue) can not be drawn in violin clef")
        }
    }
    
    func getNoteNeedsHelpLine(note: Note) -> Bool {
        if note == .oneLine_C {
            return true
        } else {
            return false
        }
    }
    
    // lines of the note sheet
    var lines: some View {
        ZStack{
            line.offset(y: -2*noteHeight)
            line.offset(y: -1*noteHeight)
            line.offset(y: 0)
            line.offset(y: 1*noteHeight)
            line.offset(y: 2*noteHeight)
        }
    }
    
    var line: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 2)
    }
}

struct NoteSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NoteSheetView(noteHeight: 30, notes: [.oneLine_C, .oneLine_D, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_A, .oneLine_B])
    }
}
