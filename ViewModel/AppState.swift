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
    @Published var currentNoteToDisplay: Note? = nil
    @Published var currentMenuState: MenuState = MenuState.flow[1]
    @Published var isOn: Bool = false
    @Published var showHelp: Bool = false
    
    // used to determine if key help labels and note help labels are shown
    @Published var showHelpLabels: Bool = true
    // used to override showHelpLabels for the keyboard
    @Published var showKeyboardHelpLabels: Bool = true
    
    // track practice on note sheet progress
    @Published var practiceNotes : [Note]? = nil
    @Published var currentPracticeNoteIndex: Int = 0
    
    // used to track how many wrong answers were given, more than tree answers are wring it will activate help mode
    @Published var wrongAnswerCount: Int = 0
    
    func increaseWrongAnswerCount() {
        wrongAnswerCount += 1
        if wrongAnswerCount >= 3 {
            showHelp = true
        }
    }
    
    func reset() {
        practiceNotes = nil
        currentPracticeNoteIndex = 0
        wrongAnswerCount = 0
    }
    
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

