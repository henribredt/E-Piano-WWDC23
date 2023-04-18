//
//  OctaveView.swift
//  WWDC23
//
//  Created by Henri Bredt on 16.04.23.
//

import SwiftUI

struct OctaveView: View {
    let drawingHeight: CGFloat
    let octave: Octave
    
    var body: some View {
        let width = drawingHeight*(135.0/578.0)
        
        // white keys
        HStack(spacing: 3){
            KeyView(kind: .white_r_cutout, label: "C\(getMarker(octave))", width: width, height: drawingHeight, note: Note(rawValue: "\(octave.rawValue)_C")!)
            KeyView(kind: .white_lr_cutout, label: "D", width: width, height:drawingHeight, note: Note(rawValue: "\(octave.rawValue)_D")!)
            KeyView(kind: .white_l_cutout, label: "E", width: width, height: drawingHeight, note: Note(rawValue: "\(octave.rawValue)_E")!)
            KeyView(kind: .white_r_cutout, label: "F", width: width, height: drawingHeight, note: Note(rawValue: "\(octave.rawValue)_F")!)
            KeyView(kind: .white_lr_cutout, label: "G", width: width, height:drawingHeight, note: Note(rawValue: "\(octave.rawValue)_G")!)
            KeyView(kind: .white_lr_cutout, label: "A", width: width, height:drawingHeight, note: Note(rawValue: "\(octave.rawValue)_A")!)
            KeyView(kind: .white_l_cutout, label: "B", width: width, height: drawingHeight, note: Note(rawValue: "\(octave.rawValue)_B")!)
        }
        
        // black keys
        .overlay(alignment: .top) {
            HStack(spacing: 3) {
                KeyView(kind: .black, label: "C#", width: width, height: drawingHeight, note: Note(rawValue: "\(octave.rawValue)_C_Sharp")!)
                KeyView(kind: .black, label: "D#", width: width, height: drawingHeight, note: Note(rawValue: "\(octave.rawValue)_D_Sharp")!)
                KeyView(kind: .black, label: "NONE", width: width, height: drawingHeight, note: Note(rawValue: "\(octave.rawValue)_C")!)
                    .opacity(0)
                KeyView(kind: .black, label: "F#", width: width, height: drawingHeight, note: Note(rawValue: "\(octave.rawValue)_F_Sharp")!)
                KeyView(kind: .black, label: "G#", width: width, height: drawingHeight, note: Note(rawValue: "\(octave.rawValue)_G_Sharp")!)
                KeyView(kind: .black, label: "A#", width: width, height: drawingHeight, note: Note(rawValue: "\(octave.rawValue)_A_Sharp")!)
            }
        }
    }
    
    func getMarker(_ octave: Octave) -> String {
        switch octave {
        case .small:
            return ""
        case .oneLine:
            return "\'"
        case .twoLine:
            return "\''"
        }
    }
}

struct OctaveView_Previews: PreviewProvider {
    static var previews: some View {
        OctaveView(drawingHeight: 300, octave: .oneLine)
            .padding()
            .frame(width: 550, height: 330)
            .previewLayout(.sizeThatFits)
    }
}
