//
//  MenuState.swift
//  
//
//  Created by Henri Bredt on 17.04.23.
//

import Foundation
import SwiftUI

struct MenuState {
    
    let view: AnyView
    
    let headerText: String?
    
    let helpPlayNotesLabel: Bool
    let helpLabel: String
    let helpDescription: String
    
    let optionButtonAction: () -> ()
}

extension MenuState {
    static var flow: [MenuState] = [
        // 0
        MenuState(view: AnyView(EmptyView()), headerText: nil, helpPlayNotesLabel: false, helpLabel: "POWER", helpDescription: "to turn me on", optionButtonAction: {}),
        // 1
        MenuState(view: AnyView(Text("Craig ePianighi\nYour educational E-Piano")), headerText: "WELCOME", helpPlayNotesLabel: false, helpLabel: "OPTION", helpDescription: "start the course or just play the piano freely", optionButtonAction: {
            AppState.shared.currentMenuState = MenuState.flow[2]
        }),
        // 2
        MenuState(view: AnyView(Text("The Middle C is our starting point on the keyboard. It's marked with C'. Find it on the keyboard next to the center two black keys. On the next page you will see the notation of C' in violin clef notation and start playing.")), headerText: "The Middle C - Theory", helpPlayNotesLabel: false, helpLabel: "OPTION", helpDescription: "to continue", optionButtonAction: {
            AppState.shared.currentMenuState = MenuState.flow[3]
        }),
        // 3
        MenuState(view: AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C] )), headerText: "The Middle C - Practice", helpPlayNotesLabel: true, helpLabel: "OPTION", helpDescription: "for help.", optionButtonAction: {
            AppState.shared.currentMenuState = MenuState.flow[4]
        }),
        // 4
        MenuState(view: AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C, .oneLine_D, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_A, .oneLine_B] )), headerText: "An Octave", helpPlayNotesLabel: true, helpLabel: "OPTION", helpDescription: "for help.", optionButtonAction: {
            AppState.shared.currentMenuState = MenuState.flow[2]
        }),
    ]
}
