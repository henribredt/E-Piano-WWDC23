//
//  SwiftUIView.swift
//  
//
//  Created by Henri Bredt on 17.04.23.
//

import SwiftUI

struct NoteSheetView: View {
    
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
                    ForEach(notes) { note in
                        NoteShape(helpLine: getNoteNeedsHelpLine(note: note))
                            .offset(y: getNoteOffsetInViolinClef(note: note)*noteHeight)
                            .aspectRatio(250/145, contentMode: .fill)
                            .frame(width: noteHeight*145/250, height: noteHeight)
                            .overlay {
                                // help label
                                Text(note.getHelpLabel())
                                    .offset(y: -3.5*noteHeight)
                            }
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
