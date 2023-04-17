//
//  MenuState.swift
//  
//
//  Created by Henri Bredt on 17.04.23.
//

import Foundation
import SwiftUI

struct MenuState {
    
    init(id: Int, view: AnyView, notes: [Note]? = nil, isMultiStateMusicSheet: Bool = false, headerText: String? = nil, showUIHelpLabels: Bool = true, helpPlayNotesLabel: Bool = false, helpLabel: String, helpDescription: String, showNextMenuState: @escaping () -> ()) {
        self.id = id
        self.view = view
        self.notes = notes
        self.isMultiStateMusicSheet = isMultiStateMusicSheet
        self.headerText = headerText
        self.showUIHelpLabels = showUIHelpLabels
        self.helpPlayNotesLabel = helpPlayNotesLabel
        self.helpLabel = helpLabel
        self.helpDescription = helpDescription
        self.showNextMenuState = showNextMenuState
    }
    
    
   
    
    let id: Int
    let view: AnyView // center view to show
    let notes: [Note]? // notes of current menu state
    let isMultiStateMusicSheet: Bool // if music is spread over multiple menu states, will transition immediately to next
    let headerText: String? // text in the header
    let showUIHelpLabels: Bool // show help labels on keys and in notation
    let helpPlayNotesLabel: Bool // if a label saying "Play all notes to continue" should be shown in lower area
    let helpLabel: String // label in the lower area explaining the button
    let helpDescription: String // label in the lower area explaining what the button does
    let showNextMenuState: () -> () // what happens on enter button press
    
    func playingHelpAllowed() -> Bool {
        return notes != nil
    }
}

extension MenuState: Comparable {
    static func < (lhs: MenuState, rhs: MenuState) -> Bool {
        lhs.id < rhs.id
    }
    
    static func == (lhs: MenuState, rhs: MenuState) -> Bool {
        lhs.id == rhs.id
    }
    
    
}

extension MenuState {
    static var flow: [MenuState] = [
        // 0 - INFO
        MenuState(id: 0, view: AnyView(Text("About ePianighi \"Craig 23\"\nSwift Student Challenge Submission 2023 by Henri Bredt\n\nPiano Sounds: https://github.com/fuhton/piano-mp3\nButton Sounds: https://snd.dev\nSVG to SwiftUI Shape : https://svg-to-swiftui.quassum.com")), helpPlayNotesLabel: false, helpLabel: "ENTER", helpDescription: "to dismiss.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[2]
        }),
        // 1 - OFF
        MenuState(id: 1, view: AnyView(EmptyView()), headerText: nil, helpPlayNotesLabel: false, helpLabel: "POWER", helpDescription: "to turn me on", showNextMenuState: {
        }),
        
        MenuState(id: 2, view: AnyView(
            VStack(spacing: 6){
                Image(systemName: "pianokeys.inverse")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 40)
                    .padding(.bottom)
                    Text("ePianighi \"Craig 23\"")
                        .bold()
                    Text("Your educational E-Piano")
                        .font(.system(.caption, design: .monospaced))
            }
            .padding(10).padding(.bottom, 30)
        ), headerText: "WELCOME", helpPlayNotesLabel: false, helpLabel: "ENTER", helpDescription: "to learn how to play the piano. Or just play.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[3]
        }),
        MenuState(id: 3, view: AnyView(Text("Some quick info before we start: You can adjust the keyboard size using the magnifying buttons and you can scroll the keyboard to make other keys visible. Make sure the Volume is turned up and your device is not muted.")), headerText: "Beginners Course: Learn how to play the Piano", helpPlayNotesLabel: false, helpLabel: "ENTER", helpDescription: "to continue.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[4]
        }),
        MenuState(id: 4, view: AnyView(Text("The Middle C is our starting point on the keyboard. It's marked with C'. Find it on the keyboard next to the center two black keys. On the next page you will see the notation of C' in violin clef and start playing.")), headerText: "1. The Middle C - Theory", helpPlayNotesLabel: false, helpLabel: "ENTER", helpDescription: "to continue.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[5]
        }),
        MenuState(id: 5, view: AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C] )), notes: [.oneLine_C], headerText: "1. The Middle C - Practice", helpPlayNotesLabel: true, helpLabel: "INFO", helpDescription: "for help.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[6]
        }),
        MenuState(id: 6, view: AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C, .oneLine_D, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_A, .oneLine_B] )), notes: [.oneLine_C, .oneLine_D, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_A, .oneLine_B], headerText: "2. An Octave", helpPlayNotesLabel: true, helpLabel: "INFO", helpDescription: "for help.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[7]
        }),
        MenuState(id: 7, view:
                    AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_E, .oneLine_F, .oneLine_C] )), notes: [.oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_E, .oneLine_F, .oneLine_C], headerText: "3. Practice", helpPlayNotesLabel: true, helpLabel: "INFO", helpDescription: "for help.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[8]
        }),
        MenuState(id: 8, view:
                    AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_E, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_G, .oneLine_F, .oneLine_E, .oneLine_D] )), notes: [.oneLine_E, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_G, .oneLine_F, .oneLine_E, .oneLine_D], isMultiStateMusicSheet: true, headerText: "4. Play — Ode to Joy", helpPlayNotesLabel: true, helpLabel: "INFO", helpDescription: "for help.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[9]
        }),
        MenuState(id: 9, view:
                    AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C, .oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_C, .oneLine_C] )), notes: [.oneLine_C, .oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_C, .oneLine_C], headerText: "4. Play — Ode to Joy", helpPlayNotesLabel: true, helpLabel: "INFO", helpDescription: "for help.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[10]
        }),
        
        MenuState(id: 10, view: AnyView(Text("Good job!\n\nLet's try it without any help labels like a real pianist.")), headerText: "5. Play — Ode to Joy", showUIHelpLabels: false, helpPlayNotesLabel: false, helpLabel: "ENTER", helpDescription: "to continue.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[11]
        }),
        MenuState(id: 11, view:
                    AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_E, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_G, .oneLine_F, .oneLine_E, .oneLine_D] )), notes: [.oneLine_E, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_G, .oneLine_F, .oneLine_E, .oneLine_D], isMultiStateMusicSheet: true, headerText: "5. Play — Ode to Joy", showUIHelpLabels: false, helpPlayNotesLabel: true, helpLabel: "INFO", helpDescription: "for help.", showNextMenuState: {
                        AppState.shared.currentMenuState = MenuState.flow[12]
                    }),
        MenuState(id: 12, view:
                    AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C, .oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_C, .oneLine_C] )), notes: [.oneLine_C, .oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_C, .oneLine_C], headerText: "5. Play — Ode to Joy", showUIHelpLabels: false, helpPlayNotesLabel: true, helpLabel: "INFO", helpDescription: "for help.", showNextMenuState: {
                        AppState.shared.currentMenuState = MenuState.flow[13]
                    }),
        
        
        // 13 - change
        MenuState(id: 13, view:
                    AnyView(Text("Well done!\n\n You've successfully finished the Beginners Course.\nLet's jam together at WWDC 23 — see you there!")), notes: nil, isMultiStateMusicSheet: false, headerText: "Beginners Course: Learn how to play the Piano", helpPlayNotesLabel: false, helpLabel: "ENTER", helpDescription: "to return to the menu.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[2]
        }),
    ]
}
