//
//  SoundEngine.swift
//  WWDC23
//
//  Created by Henri Bredt on 16.04.23.
//

import Foundation
import AVFoundation

struct SoundEngine {
    static var player: AVAudioPlayer?
    
    private static func playSound(resource: String, type: String) {
        guard let path = Bundle.main.path(forResource: resource, ofType: type) else {
            print("cant find file")
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player!.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    static func buttonSound() {
        player?.stop()
        playSound(resource: "toggle_on", type: "wav")
    }
    
    static func play(note: Note){
        player?.stop()
        playSound(resource: note.rawValue, type: "mp3")
        
    }
}
