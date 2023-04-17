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
                            VStack{
                                Spacer()
                                DisplayShapeView(geo: geo, upperGeo: upperGeo)
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
                                HStack{
                                    Button {
                                        if appState.isOn {
                                            appState.isOn.toggle()
                                            appState.currentMenuState = MenuState.flow[0]
                                            SoundEngine.buttonSound()
                                        } else {
                                            appState.isOn.toggle()
                                            appState.currentMenuState = MenuState.flow[1]
                                            SoundEngine.playCelebration()
                                        }
                                    } label: {
                                        Rectangle()
                                            .fill(LinearGradient(
                                                gradient: .init(colors: [Color.white, Color("UIGray")]),
                                                startPoint: .init(x: 0.5, y: 0),
                                                endPoint: .init(x: 0.5, y: 0.6)
                                            ))
                                            .cornerRadius(100)
                                            .frame(width: 90, height: 30)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 100)
                                                    .stroke(Color("DarkGray"), lineWidth: 2)
                                            )
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 100)
                                                    .frame(width: 55, height: 6)
                                                    .foregroundColor(appState.isOn ? .red.opacity(0.8) : .gray.opacity(0.9))
                                                    .shadow(color: .red.opacity(appState.isOn ? 0.8 : 0.0), radius: 3)
                                            }
                                    }
                                    Text("POWER")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundColor(Color("DarkGray"))
                                        .padding(.leading)
                                }
                                
                                
                                HStack{
                                    Button {
                                        appState.currentMenuState.optionButtonAction()
                                        SoundEngine.buttonSound()
                                    } label: {
                                        Rectangle()
                                            .fill(LinearGradient(
                                                gradient: .init(colors: [Color.white, Color("UIGray")]),
                                                startPoint: .init(x: 0.5, y: 0),
                                                endPoint: .init(x: 0.5, y: 0.6)
                                            ))
                                            .cornerRadius(100)
                                            .frame(width: 90, height: 30)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 100)
                                                    .stroke(Color("DarkGray"), lineWidth: 2)
                                            )
                                    }
                                    Text("OPTION")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundColor(Color("DarkGray"))
                                        .padding(.leading)
                                }
                                
                                HStack{
                                    Button {
                                        //
                                        SoundEngine.buttonSound()
                                    } label: {
                                        Rectangle()
                                            .fill(LinearGradient(
                                                gradient: .init(colors: [Color.white, Color("UIGray")]),
                                                startPoint: .init(x: 0.5, y: 0),
                                                endPoint: .init(x: 0.5, y: 0.6)
                                            ))
                                            .cornerRadius(100)
                                            .frame(width: 90, height: 30)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 100)
                                                    .stroke(Color("DarkGray"), lineWidth: 2)
                                            )
                                    }
                                    Text("INFO")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundColor(Color("DarkGray"))
                                        .padding(.leading)
                                }
                            }
                            Spacer()
                        }
                        .padding(.top)
                    }
                    
                }
                .padding(.bottom, 1)
                
                HStack(spacing: 10){
                    VStack(alignment: .leading, spacing: 3){
                        Text("Craig ePianighi 23").bold()
                        Text("Educational E-Piano")
                    }
                    .font(.system(.footnote, design: .monospaced))
                    .foregroundColor(Color("DarkGray"))
                    .padding(.leading)
                    Spacer()
                    Button {
                        sizeDivisor += 0.5
                        SoundEngine.buttonSound()
                    } label: {
                        Rectangle()
                            .fill(LinearGradient(
                                gradient: .init(colors: [Color.white, Color("UIGray")]),
                                startPoint: .init(x: 0.5, y: 0),
                                endPoint: .init(x: 0.5, y: 0.6)
                            ))
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("DarkGray"), lineWidth: 2)
                            )
                            .overlay(
                                Image(systemName: "minus.magnifyingglass")
                                    .foregroundColor(Color("DarkGray"))
                                    .font(.title3)
                                    .padding(EdgeInsets(top: 6, leading: 18, bottom: 6, trailing: 18))
                            )
                            .frame(width: 90)
                            .padding(.vertical, 10)
                            .padding(.trailing, 6)
                    }
                    .disabled(sizeDivisor >= 6.5)
                    
                    
                    Button {
                        sizeDivisor -= 0.5
                        SoundEngine.buttonSound()
                    } label: {
                        Rectangle()
                            .fill(LinearGradient(
                                gradient: .init(colors: [Color.white, Color("UIGray")]),
                                startPoint: .init(x: 0.5, y: 0),
                                endPoint: .init(x: 0.5, y: 0.6)
                            ))
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("DarkGray"), lineWidth: 2)
                            )
                            .overlay(
                                Image(systemName: "plus.magnifyingglass")
                                    .foregroundColor(Color("DarkGray"))
                                    .font(.title3)
                                    .padding(EdgeInsets(top: 6, leading: 18, bottom: 6, trailing: 18))
                            )
                            .frame(width: 90)
                            .padding(.vertical, 10)
                            .padding(.trailing, 6)
                    }
                    .disabled(sizeDivisor <= 4)
                    .padding(.trailing, 9)
                }
                .frame(width: geo.size.width, height: 60)
                .background(){
                    Rectangle()
                        .fill(Color("UIGray"))
                    
                        .shadow(color: .red.opacity(0.5), radius: 5, y: 10)
                        .zIndex(10)
                }
                
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
    
    var key: some View {
        Button {
            print("pressed")
        } label: {
            
            Image("KeyWhite_rightCutout")
                .resizable()
                .scaledToFit()
        }
        
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
