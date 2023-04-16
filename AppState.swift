//
//  AppState.swift
//  WWDC23
//
//  Created by Henri Bredt on 16.04.23.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var currentNote: Note? = nil
}
