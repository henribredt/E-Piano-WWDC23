import SwiftUI

@available(iOS 16.0, *)
@main
struct MyApp: App {
    // Piano Notes: https://github.com/fuhton/piano-mp3 (MIT License)
    var body: some Scene {
        @StateObject var appState = AppState()
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
