import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    @State private var sizeDivisor: CGFloat = 5
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0){
                ZStack(alignment: .center){
                    GeometryReader { upperGeo in
                        Rectangle()
                            .fill(Color("UIGray"))
                        
                        HStack{
                            Spacer()
                            
                            // Display
                            VStack{
                                Spacer()
                                DisplayShapeView(geo: geo, upperGeo: upperGeo)
                                    .task(id: appState.currentMenuState){
                                        appState.practiceNotes = appState.currentMenuState.notes
                                        appState.currentPracticeNoteIndex = 0
                                        appState.currentNote = nil
                                    }
                                // Menu
                                    .overlay{
                                        VStack {
                                            HeaderView()
                                            if appState.isOn { Spacer() }
                                            appState.currentMenuState.view
                                                .multilineTextAlignment(.center)
                                                .font(.system(.body, design: .monospaced))
                                                .lineSpacing(3)
                                            if appState.isOn { Spacer() }
                                            HelpLabelView()
                                        }
                                        .foregroundColor(Color("DarkGray"))
                                        .shadow(color: .black.opacity(0.4), radius: 2, x: 2, y: 3)
                                        .opacity(0.75)
                                        .padding(25)
                                    }
                                Spacer()
                            }
                            
                            
                            Spacer()
                            VStack(alignment: .leading, spacing: 30){
                              
                                MenuButtonView(label: "power", isPowerButton: true) {
                                    if appState.isOn {
                                        appState.isOn.toggle()
                                        appState.currentMenuState = MenuState.flow[1]
                                        SoundEngine.buttonSound()
                                    } else {
                                        appState.isOn.toggle()
                                        appState.currentMenuState = MenuState.flow[2]
                                        SoundEngine.playCelebration()
                                    }
                                }
                                
                                MenuButtonView(label: "option", isPowerButton: false) {
                                    appState.currentMenuState.showNextMenuState()
                                    SoundEngine.buttonSound()
                                }
                                
                                MenuButtonView(label: "info", isPowerButton: false) {
                                    appState.showHelp.toggle()
                                    SoundEngine.buttonSound()
                                }
                            }
                            Spacer()
                        }
                        .padding(.top)
                    }
                    
                }
                .padding(.bottom, 1)
                
                AboveKeyboardButtonBar(geo: geo, sizeDivisor: $sizeDivisor)
//                    I can't fix the wired button animation, mmmm :/
//                    .animation(.none)
                   
                // Keyboard
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 3){
                        ForEach(Octave.allCases, id: \.self) { octave in
                            OctaveView(drawingHeight: geo.size.height/sizeDivisor*2, octave: octave)
                        }
                    }
                    .disabled(!appState.isOn)
                }
                .frame(width: geo.size.width, height: geo.size.height/sizeDivisor*2)
                .padding(.bottom, 24)
                .padding(.top, 3)
                .background{
                    Color.black
                }
            }
        }
        .background{
            Color.black
        }
        .ignoresSafeArea()
    }
    
}

@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        @StateObject var appState = AppState()
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(appState)
    }
}
