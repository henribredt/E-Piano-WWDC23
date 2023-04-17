import SwiftUI

@available(iOS 16.0, *)
@main
struct MyApp: App {
    // Piano Notes: https://github.com/fuhton/piano-mp3 (MIT License)
   
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
