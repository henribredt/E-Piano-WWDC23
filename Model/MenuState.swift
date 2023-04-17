//
//  MenuState.swift
//  
//
//  Created by Henri Bredt on 17.04.23.
//

import Foundation
import SwiftUI

struct MenuState {
    
    let id: Int
    let view: AnyView
    let notes: [Note]?
    
    let headerText: String?
    
    let helpPlayNotesLabel: Bool
    let helpLabel: String
    let helpDescription: String

    let showNextMenuState: () -> ()
    
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
        MenuState(id: 0, view: AnyView(Text("Help")), notes: nil, headerText: nil, helpPlayNotesLabel: false, helpLabel: "OPTION", helpDescription: "to dismiss.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[2]
        }),
        // 1 - OFF
        MenuState(id: 1, view: AnyView(EmptyView()), notes: nil, headerText: nil, helpPlayNotesLabel: false, helpLabel: "POWER", helpDescription: "to turn me on", showNextMenuState: {
        }),
        
        MenuState(id: 2, view: AnyView(Text("Craig ePianighi\nYour educational E-Piano")), notes: nil, headerText: "WELCOME", helpPlayNotesLabel: false, helpLabel: "OPTION", helpDescription: "learn how to play the piano. Or just play.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[3]
        }),
        MenuState(id: 3, view: AnyView(Text("Some quick info before we start: You can adjust the keyboard size using the magnifying buttons and you can scroll the keyboard to make other keys visible. Make sure the Volume is turned up and your device is not muted.")), notes: nil, headerText: "Beginners Course: Learn how to play the Piano", helpPlayNotesLabel: false, helpLabel: "OPTION", helpDescription: "to continue.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[4]
        }),
        MenuState(id: 4, view: AnyView(Text("The Middle C is our starting point on the keyboard. It's marked with C'. Find it on the keyboard next to the center two black keys. On the next page you will see the notation of C' in violin clef and start playing.")), notes: nil, headerText: "1. The Middle C - Theory", helpPlayNotesLabel: false, helpLabel: "OPTION", helpDescription: "to continue.", showNextMenuState: {
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
                    AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_E, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_G, .oneLine_F, .oneLine_E, .oneLine_D] )), notes: [.oneLine_E, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_G, .oneLine_F, .oneLine_E, .oneLine_D], headerText: "4. Play — Ode to Joy", helpPlayNotesLabel: true, helpLabel: "INFO", helpDescription: "for help.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[9]
        }),
        
        
        
        
        // 9 - chan
        MenuState(id: 9, view:
                    AnyView(Text("Well done!\n\n You've successfully finished the Beginners Course.\nLet's jam together at WWDC 23 — see you there!")), notes: nil, headerText: "Beginners Course: Learn how to play the Piano", helpPlayNotesLabel: false, helpLabel: "OPTION", helpDescription: "to return to the menu.", showNextMenuState: {
            AppState.shared.currentMenuState = MenuState.flow[2]
        }),
    ]
}
