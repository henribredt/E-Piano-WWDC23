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
                SoundEngine.play(note: note)
            } label: {
                ZStack(alignment: .bottom){
                    Image(kind.rawValue)
                        .resizable()
                        .scaledToFit()
                    Text(label)
                        .padding(.bottom, geo.size.height/9)
                        .font(kind != .black ? .title3.bold() : .caption.bold())
                        .foregroundColor(kind != .black ? .black : .white)
                        .opacity(kind != .black ? 0.15 : 0.35)
                }
                .frame(width: width, height: kind != .black ? height : height/1.85)
            }
       }
       .frame(width: width)
    }
}

struct KeyView_Previews: PreviewProvider {
   
    static var previews: some View {
        KeyView(kind: .white_r_cutout, label: "C", width: 500, height: 135, note: .small_A)
//        let height = 500.0
//        let width = height*(135.0/578.0)
//        HStack(spacing: 3){
//            KeyView(kind: .white_r_cutout, label: "C", width: width, height: height, pressed: .constant(true))
//            KeyView(kind: .white_lr_cutout, label: "D", width: width, height: height, pressed: .constant(true))
//            KeyView(kind: .white_l_cutout, label: "E", width: width, height: height, pressed: .constant(true))
//            KeyView(kind: .white_r_cutout, label: "F", width: width, height: height, pressed: .constant(true))
//            KeyView(kind: .white_lr_cutout, label: "G", width: width, height: height, pressed: .constant(true))
//            KeyView(kind: .white_lr_cutout, label: "A", width: width, height: height, pressed: .constant(true))
//            KeyView(kind: .white_l_cutout, label: "B", width: width, height: height, pressed: .constant(true))
//        }
//        .overlay(alignment: .top) {
//            HStack(spacing: 3) {
//                KeyView(kind: .black, label: "C#", width: width, height: height, pressed: .constant(true))
//                KeyView(kind: .black, label: "C#", width: width, height: height, pressed: .constant(true))
//                KeyView(kind: .black, label: "C#", width: width, height: height, pressed: .constant(true))
//                    .opacity(0)
//                KeyView(kind: .black, label: "C#", width: width, height: height, pressed: .constant(true))
//                KeyView(kind: .black, label: "C#", width: width, height: height, pressed: .constant(true))
//                KeyView(kind: .black, label: "C#", width: width, height: height, pressed: .constant(true))
//            }
//         //   .offset(x: )
//        }
//        .padding()
//        .background{
//            Color.black
//        }
//
    }
}
