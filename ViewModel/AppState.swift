//
//  AppState.swift
//  WWDC23
//
//  Created by Henri Bredt on 16.04.23.
//

import SwiftUI

class AppState: ObservableObject {
    public static let shared = AppState()
    
    @Published var currentNote: Note? = nil
    @Published var currentMenuState: MenuState = MenuState.flow[1]
    @Published var isOn: Bool = false
    @Published var showHelp: Bool = false
    
    // track practice on note sheet progress
    @Published var practiceNotes : [Note]? = nil
    @Published var currentPracticeNoteIndex: Int = 0
    
    
    func currentPracticeNote() -> Note? {
        if let notes = practiceNotes {
            guard currentPracticeNoteIndex < notes.count else {
                print("Index \(currentPracticeNoteIndex) not found in practiceNotes with \(practiceNotes?.count ?? -1) items. Returning nil")
                return nil
            }
            return notes[currentPracticeNoteIndex]
        }
        return nil
    }
}

