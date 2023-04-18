//
//  MenuState.swift
//  
//
//  Created by Henri Bredt on 17.04.23.
//

import Foundation
import SwiftUI

struct MenuState {
    
    init(id: Int, view: AnyView, notes: [Note]? = nil, isMultiStateMusicSheet: Bool = false, headerText: String?, showUIHelpLabels: Bool = true, helpPlayNotesLabel: Bool = false, helpLabel: String, helpDescription: String, showNextMenuState: @escaping () -> ()) {
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
        MenuState(
            id: 0,
            view:
                AnyView(
                    VStack(spacing: 6){
                        Text("About ePianighi \"Craig 23\"").bold()
                        Text("Swift Student Challenge Submission 2023 by [Henri Bredt](https://henribredt.de)")
                            .font(.system(.callout, design: .monospaced))
                        Text("Resources and Credits").bold()
                            .font(.system(.caption, design: .monospaced))
                            .padding(.top, 33)
                        Text("Piano Sounds: https://github.com/fuhton/piano-mp3\nButton Sounds: https://snd.dev\nSVG to SwiftUI Shape : https://svg-to-swiftui.quassum.com")
                            .font(.system(.caption, design: .monospaced))
                    }
                        .tint(Color("LinkColor"))
                        .padding(.bottom, 30)
                ),
            headerText: nil,
            helpPlayNotesLabel: false,
            helpLabel: "ENTER",
            helpDescription: "to dismiss.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[2]
            }
        ),
        
        // 1 - OFF
        MenuState(
            id: 1,
            view: AnyView(EmptyView()),
            headerText: nil,
            helpPlayNotesLabel: false,
            helpLabel: "POWER",
            helpDescription: "to turn me on",
            showNextMenuState: {}
        ),
        
        MenuState(
            id: 2,
            view:
                AnyView(
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
                ),
            headerText: "WELCOME",
            helpPlayNotesLabel: false,
            helpLabel: "ENTER",
            helpDescription: "to learn how to play the piano. Or just play.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[3]
            }
        ),
        MenuState(
            id: 3,
            view:
                AnyView(Text("Good to know before we start: You can adjust the keyboard size using the magnifying buttons and you can scroll the keyboard to make other keys visible. Make sure the Volume is turned up and your device is not muted.")),
            headerText: "Beginners Course: Learn how to play the Piano",
            helpPlayNotesLabel: false,
            helpLabel: "ENTER",
            helpDescription: "to continue.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[4]
            }
        ),
        MenuState(
            id: 4,
            view:
                AnyView(
                    VStack{
                        Image(systemName: "music.quarternote.3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 40)
                            .padding(.bottom)
                        Text("Let's learn how to play the piano and read notes!")
                            .padding(.bottom, 25)
                    }
                ),
            headerText: "Beginners Course: Learn how to play the Piano",
            helpLabel: "ENTER",
            helpDescription: "to continue.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[5]
            }
        ),
        MenuState(
            id: 5,
            view: AnyView(Text("The Middle C is our starting and a reference point on the keyboard. It's marked with C'. Find it on the keyboard next to the center two black keys. On the next page you will see the notation of that note and start playing.")),
            headerText: "1. The Middle C - Theory",
            helpPlayNotesLabel: false,
            helpLabel: "ENTER",
            helpDescription: "to continue.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[6]
            }
        ),
        MenuState(
            id: 6,
            view:
                AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C] )),
            notes: [.oneLine_C],
            headerText: "1. The Middle C - Practice",
            helpPlayNotesLabel: true,
            helpLabel: "INFO",
            helpDescription: "for help.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[7]
            }
        ),
        MenuState(
            id: 7,
            view:
                AnyView(Text("While looking at the keyboard you might have noticed a pattern: The key arrangements and the notes are repetitive. Starting with the \"C\", after every seven white keys a new repetition begins. That's an Octave: The seven white keys represent the full-tones C, D, E, F, G, A and B. So there are Octaves with higher and lower pitches.")),
            headerText: "2. An Octave — Theory",
            helpPlayNotesLabel: false,
            helpLabel: "ENTER",
            helpDescription: "to continue.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[8]
            }
        ),
        MenuState(
            id: 8,
            view:
                AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C, .oneLine_D, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_A, .oneLine_B] )),
            notes: [.oneLine_C, .oneLine_D, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_A, .oneLine_B],
            headerText: "2. An Octave — Practice",
            helpPlayNotesLabel: true,
            helpLabel: "INFO",
            helpDescription: "for help.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[9]
            }
        ),
        MenuState(
            id: 9,
            view:
                AnyView(Text("You might have noticed the large symbol on the left side of the music sheet. That's the treble clef and it indicates which notes to play with your right hand. It's like a musical map, with higher lines representing higher pitches.")),
            headerText: "3. The Treble Clef & G — Theory",
            helpPlayNotesLabel: false,
            helpLabel: "ENTER",
            helpDescription: "to contine.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[10]
            }
        ),
        MenuState(
            id: 10,
            view:
                AnyView(Text("The note \"G\" is important in the context of the treble clef because it determines the clef's position on the staff and serves as a reference point for identifying other notes. Take a look on the next page: The Note \"G\" is on the line that goes trough the inner circle of the treble clef. This helps to quickly spot the \"G\".")),
            headerText: "3. The Treble Clef & G — Theory",
            helpPlayNotesLabel: false,
            helpLabel: "ENTER",
            helpDescription: "to continue.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[11]
            }
        ),
        MenuState(
            id: 11,
            view:
                AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_G] )),
            notes: [.oneLine_G],
            headerText: "3. The Treble Clef & G — Practice",
            helpPlayNotesLabel: true,
            helpLabel: "INFO",
            helpDescription: "for help.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[12]
            }
        ),
        MenuState(
            id: 12,
            view:
                AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_E, .oneLine_F, .oneLine_G] )),
            notes: [.oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_E, .oneLine_F, .oneLine_G],
            headerText: "3. The Treble Clef & G — Practice",
            helpPlayNotesLabel: true,
            helpLabel: "INFO",
            helpDescription: "for help.", showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[13]
            }
        ),
        MenuState(
            id: 13,
            view:
                AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_G, .oneLine_E, .oneLine_G, .oneLine_C, .oneLine_G] )),
            notes: [.oneLine_G, .oneLine_E, .oneLine_G, .oneLine_C, .oneLine_G],
            headerText: "3. The Treble Clef & G — Practice",
            helpPlayNotesLabel: true,
            helpLabel: "INFO",
            helpDescription: "for help.", showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[14]
            }
        ),
        MenuState(
            id: 14,
            view:
                AnyView(Text("You're progressing swiftly and are now ready to play your first real piece of piano music. It's a part of Beethoven's Symphony No. 9 \"Ode to Joy\" — a very well known piece and the European anthem.")),
            headerText: "4. Play — Ode to Joy (Beethoven)",
            helpPlayNotesLabel: false,
            helpLabel: "ENTER",
            helpDescription: "to continue.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[15]
            }
        ),
    
        MenuState(
            id: 15,
            view:
                AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_E, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_G, .oneLine_F, .oneLine_E, .oneLine_D] )),
            notes: [.oneLine_E, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_G, .oneLine_F, .oneLine_E, .oneLine_D],
            isMultiStateMusicSheet: true,
            headerText: "4. Play — Ode to Joy (Beethoven)",
            helpPlayNotesLabel: true,
            helpLabel: "INFO",
            helpDescription: "for help.", showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[16]
            }
        ),
        MenuState(
            id: 16,
            view:
                AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C, .oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_C, .oneLine_C] )),
            notes: [.oneLine_C, .oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_C, .oneLine_C], headerText: "4. Play — Ode to Joy (Beethoven)",
            helpPlayNotesLabel: true,
            helpLabel: "INFO",
            helpDescription: "for help.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[17]
            }
        ),
        
        MenuState(
            id: 17,
            view:
                AnyView(Text("Well done!\n\nSo far the notes and the keys had some help-labels to get you started. Let's try it without them, like a real pianist.")),
            headerText: "4. Play — Ode to Joy (Beethoven)",
            showUIHelpLabels: false,
            helpPlayNotesLabel: false,
            helpLabel: "ENTER",
            helpDescription: "to continue.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[18]
            }
        ),
        MenuState(
            id: 18,
            view:
                AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_E, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_G, .oneLine_F, .oneLine_E, .oneLine_D] )),
            notes:
                [.oneLine_E, .oneLine_E, .oneLine_F, .oneLine_G, .oneLine_G, .oneLine_F, .oneLine_E, .oneLine_D],
            isMultiStateMusicSheet: true,
            headerText: "4. Play — Ode to Joy (Beethoven)",
            showUIHelpLabels: false,
            helpPlayNotesLabel: true,
            helpLabel: "INFO",
            helpDescription: "for help.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[19]
            }
        ),
        MenuState(
            id: 19,
            view:
                AnyView(NoteSheetView(noteHeight: 20, notes: [.oneLine_C, .oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_C, .oneLine_C] )),
            notes: [.oneLine_C, .oneLine_C, .oneLine_D, .oneLine_E, .oneLine_D, .oneLine_C, .oneLine_C],
            headerText: "4. Play — Ode to Joy (Beethoven)",
            showUIHelpLabels: false,
            helpPlayNotesLabel: true,
            helpLabel: "INFO",
            helpDescription: "for help.",
            showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[20]
            }
        ),
        MenuState(
            id: 20,
            view:
                AnyView(Text("Well done!\n\n You've successfully finished the Beginners Course.\nLet's jam together at WWDC 23 — see you there!")),
            isMultiStateMusicSheet: false,
            headerText: "Beginners Course: Learn how to play the Piano",
            showUIHelpLabels: false,
            helpPlayNotesLabel: false,
            helpLabel: "ENTER",
            helpDescription: "to return to the menu.", showNextMenuState: {
                AppState.shared.currentMenuState = MenuState.flow[2]
            }
        ),
    ]
}
